import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import '../models/folder_model.dart';
import '../models/note.dart';
import '../models/task.dart';

// TODO: REFACTOR

class StorageService {
  static const String _notesStore = 'notes';
  static const String _tasksStore = 'tasks';
  static const String _foldersStore = 'folders';
  static const String _trashStore = 'trash';
  static const String _settingsStore = 'settings';
  static const String _encryptionKeyKey = 'encryption_key';

  late final Database _db;
  late final StoreRef<String, Map<String, dynamic>> _notes;
  late final StoreRef<String, Map<String, dynamic>> _tasks;
  late final StoreRef<String, Map<String, dynamic>> _folders;
  late final StoreRef<String, Map<String, dynamic>> _trash;
  late final StoreRef<String, dynamic> _settings;
  late final encrypt.Encrypter _encrypter;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  StorageService._create(this._db) {
    _notes = stringMapStoreFactory.store(_notesStore);
    _tasks = stringMapStoreFactory.store(_tasksStore);
    _folders = stringMapStoreFactory.store(_foldersStore);
    _trash = stringMapStoreFactory.store(_trashStore);
    _settings = StoreRef<String, dynamic>(_settingsStore);
  }

  static Future<StorageService> initialize() async {
    // 获取应用文档目录
    final appDir = await getApplicationDocumentsDirectory();
    final dbPath = path.join(appDir.path, 'notes.db');

    // 创建数据库工厂
    final factory = databaseFactoryIo;

    // 打开数据库
    final db = await factory.openDatabase(
      dbPath,
      version: 1,
      // onVersionChanged: (db, oldVersion, newVersion) async {
      //   // 处理数据库迁移
      //   if (oldVersion < 1) {
      //     // 创建所需的stores
      //     final notesStore = stringMapStoreFactory.store(_notesStore);
      //     final tasksStore = stringMapStoreFactory.store(_tasksStore);
      //     final foldersStore = stringMapStoreFactory.store(_foldersStore);
      //     final trashStore = stringMapStoreFactory.store(_trashStore);
      //     final settingsStore = StoreRef<String, dynamic>(_settingsStore);
      //
      //     // 我们不需要显式创建这些store，因为它们会在首次使用时自动创建
      //     // 但是我们可以在这里添加一些初始化数据如果需要的话
      //   }
      // },
    );

    final instance = StorageService._create(db);
    await instance._initializeEncryption();
    return instance;
  }

  // 初始化加密
  Future<void> _initializeEncryption() async {
    String? key = await _secureStorage.read(key: _encryptionKeyKey);
    if (key == null) {
      // 生成新的加密密钥
      final newKey = encrypt.Key.fromSecureRandom(32);
      key = base64Encode(newKey.bytes);
      await _secureStorage.write(key: _encryptionKeyKey, value: key);
    }
    final encryptionKey = encrypt.Key.fromBase64(key);
    _encrypter = encrypt.Encrypter(encrypt.AES(encryptionKey));
  }

  // 加密数据
  String _encrypt(String data) {
    final iv = encrypt.IV.fromSecureRandom(16);
    final encrypted = _encrypter.encrypt(data, iv: iv);
    return '${encrypted.base64}:${iv.base64}';
  }

  // 解密数据
  String _decrypt(String encryptedData) {
    final parts = encryptedData.split(':');
    if (parts.length != 2) throw Exception('Invalid encrypted data format');
    final encrypted = encrypt.Encrypted.fromBase64(parts[0]);
    final iv = encrypt.IV.fromBase64(parts[1]);
    return _encrypter.decrypt(encrypted, iv: iv);
  }

  // Notes CRUD operations
  Future<List<Note>> loadNotes() async {
    final records = await _notes.find(_db);
    return records.map((record) {
      final decryptedData = _decrypt(record.value['data'] as String);
      return Note.fromJson(json.decode(decryptedData));
    }).toList();
  }

  Future<void> saveNotes(List<Note> notes) async {
    await _db.transaction((txn) async {
      // 清除现有数据
      await _notes.delete(txn);
      // 保存新数据
      for (final note in notes) {
        final encryptedData = _encrypt(json.encode(note.toJson()));
        await _notes.record(note.id).put(txn, {'data': encryptedData});
      }
    });
  }

  // Tasks CRUD operations
  Future<List<Task>> loadTasks() async {
    final records = await _tasks.find(_db);
    return records.map((record) {
      final decryptedData = _decrypt(record.value['data'] as String);
      return Task.fromJson(json.decode(decryptedData));
    }).toList();
  }

  Future<void> saveTasks(List<Task> tasks) async {
    await _db.transaction((txn) async {
      await _tasks.delete(txn);
      for (final task in tasks) {
        final encryptedData = _encrypt(json.encode(task.toJson()));
        await _tasks.record(task.id).put(txn, {'data': encryptedData});
      }
    });
  }

  // Folders CRUD operations
  Future<List<Folder>> loadFolders() async {
    final records = await _folders.find(_db);
    return records.map((record) {
      final decryptedData = _decrypt(record.value['data'] as String);
      return Folder.fromJson(json.decode(decryptedData));
    }).toList();
  }

  Future<void> saveFolders(List<Folder> folders) async {
    await _db.transaction((txn) async {
      await _folders.delete(txn);
      for (final folder in folders) {
        final encryptedData = _encrypt(json.encode(folder.toJson()));
        await _folders.record(folder.id).put(txn, {'data': encryptedData});
      }
    });
  }

  // Trash operations
  Future<List<Map<String, dynamic>>> loadTrash() async {
    final records = await _trash.find(_db);
    return records.map((record) {
      final decryptedData = _decrypt(record.value['data'] as String);
      return json.decode(decryptedData) as Map<String, dynamic>;
    }).toList();
  }

  Future<void> saveTrash(List<dynamic> trashedItems) async {
    await _db.transaction((txn) async {
      await _trash.delete(txn);
      for (final item in trashedItems) {
        final encryptedData = _encrypt(json.encode(item));
        await _trash.record(item['id'] as String).put(txn, {'data': encryptedData});
      }
    });
  }

  // Settings operations
  Future<Map<String, dynamic>> loadSettings() async {
    final settings = await _settings.record('settings').get(_db);
    if (settings != null) {
      final decryptedData = _decrypt(settings['data'] as String);
      return json.decode(decryptedData);
    }
    return {};
  }

  Future<void> saveSettings(Map<String, dynamic> settings) async {
    final encryptedData = _encrypt(json.encode(settings));
    await _settings.record('settings').put(_db, {'data': encryptedData});
  }

  // Backup and Restore
  Future<File> createBackup() async {
    final backup = {
      'notes': await _notes.find(_db),
      'tasks': await _tasks.find(_db),
      'folders': await _folders.find(_db),
      'settings': await _settings.record('settings').get(_db),
      'timestamp': DateTime.now().toIso8601String(),
      'version': 1,
    };

    final appDir = await getApplicationDocumentsDirectory();
    final backupPath = path.join(
      appDir.path,
      'backup_${DateTime.now().toIso8601String()}.json',
    );

    final file = File(backupPath);
    await file.writeAsString(json.encode(backup));
    return file;
  }

  Future<void> restoreFromBackup(String backupPath) async {
    final file = File(backupPath);
    final backupData = json.decode(await file.readAsString());

    // 验证备份版本
    if (backupData['version'] != 1) {
      throw Exception('Unsupported backup version');
    }

    await _db.transaction((txn) async {
      // 清除现有数据
      await _notes.delete(txn);
      await _tasks.delete(txn);
      await _folders.delete(txn);
      await _settings.delete(txn);

      // 恢复数据
      for (final item in backupData['notes']) {
        await _notes.record(item['key']).put(txn, item['value']);
      }
      for (final item in backupData['tasks']) {
        await _tasks.record(item['key']).put(txn, item['value']);
      }
      for (final item in backupData['folders']) {
        await _folders.record(item['key']).put(txn, item['value']);
      }
      if (backupData['settings'] != null) {
        await _settings.record('settings').put(txn, backupData['settings']);
      }
    });
  }

  // Database management
  Future<void> clearAllData() async {
    await _db.transaction((txn) async {
      await _notes.delete(txn);
      await _tasks.delete(txn);
      await _folders.delete(txn);
      await _trash.delete(txn);
      await _settings.delete(txn);
    });
  }

  Future<void> close() async {
    await _db.close();
  }

  // Utilities
  Future<int> getDatabaseSize() async {
    final file = File(path.join(
      (await getApplicationDocumentsDirectory()).path,
      'notes.db',
    ));
    return file.length();
  }

  Future<void> vacuum() async {
    // Sembast 不支持直接的 VACUUM 操作
    // 我们可以通过重新写入所有数据来间接实现类似的效果
    await _db.transaction((txn) async {
      // 读取所有数据
      final notes = await _notes.find(txn);
      final tasks = await _tasks.find(txn);
      final folders = await _folders.find(txn);
      final trash = await _trash.find(txn);
      final settings = await _settings.record('settings').get(txn);

      // 清除所有数据
      await _notes.delete(txn);
      await _tasks.delete(txn);
      await _folders.delete(txn);
      await _trash.delete(txn);
      await _settings.delete(txn);

      // 重新写入所有数据
      for (var note in notes) {
        await _notes.record(note.key).put(txn, note.value);
      }
      for (var task in tasks) {
        await _tasks.record(task.key).put(txn, task.value);
      }
      for (var folder in folders) {
        await _folders.record(folder.key).put(txn, folder.value);
      }
      for (var item in trash) {
        await _trash.record(item.key).put(txn, item.value);
      }
      if (settings != null) {
        await _settings.record('settings').put(txn, settings);
      }
    });

    // 压缩数据库文件
    await _db.compact();
  }
}
