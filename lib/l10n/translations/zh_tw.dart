import 'translation_keys.dart';

const zhTW = TranslationKeys(
  notes: {
    'title': '筆記',
    'noNotes': '暫無筆記',
    'startTyping': '開始輸入',
    'untitled': '未命名',
    'noText': '無內容',
    'searchNotes': '搜尋筆記',
    'characters': '字元',
  },
  folders: {
    'title': '資料夾',
    'newFolder': '新增資料夾',
    'folderName': '資料夾名稱',
    'all': '全部',
    'uncategorized': '未分類',
    'moveToFolder': '移動到資料夾',
    'createFolder': '建立資料夾',
    'renameFolder': '重新命名資料夾',
    'deleteFolder': '刪除資料夾',
    'deleteFolderConfirm': '確定要刪除此資料夾嗎？所有筆記將移至未分類。',
  },
  tasks: {
    'title': '任務',
    'noTasks': '暫無任務',
    'addSubtask': "按'Enter'建立子任務",
    'setReminder': '設定提醒',
    'completed': '已完成',
    'inProgress': '進行中',
  },
  actions: {
    'create': '建立',
    'rename': '重新命名',
    'delete': '刪除',
    'cancel': '取消',
    'save': '儲存',
    'done': '完成',
    'share': '分享',
    'moveToTrash': '移到資源回收桶',
    'restore': '還原',
    'deletePermanently': '永久刪除',
    'tryAgain': '重試',
  },
  settings: {
    'title': '設定',
    'style': '樣式',
    'fontSize': {
      'title': '字型大小',
      'small': '小',
      'medium': '中',
      'large': '大',
      'huge': '特大',
    },
    'sort': {
      'title': '排序',
      'byCreationDate': '依建立日期',
      'byModificationDate': '依修改日期',
    },
    'layout': {
      'title': '版面配置',
      'list': '清單',
      'grid': '網格',
    },
    'darkMode': '深色模式',
    'quickFeatures': '快速功能',
    'quickNotes': '快速筆記',
    'reminders': '提醒',
    'highPriorityReminders': '高優先級提醒',
    'highPriorityRemindersDesc': '在靜音或勿擾模式下也播放提醒音',
    'other': '其他',
    'privacyPolicy': '隱私權政策',
    'dataSharing': '筆記第三方資料共享聲明',
    'permissions': '權限詳情',
    'sortByDate': '日期（最新優先）',
    'sortByTitle': '標題',
    'include': '包含',
    'folderExists': '已存在同名資料夾',
    'enterFolderName': '請輸入資料夾名稱',
  },
  time: {
    'today': '今天',
    'yesterday': '昨天',
    'tomorrow': '明天',
    'startDate': '開始日期',
    'endDate': '結束日期',
    'to': '至',
    'at': '於',
  },
  language: {
    'title': '語言',
    'selectLanguage': '選擇語言',
    'english': 'English',
    'chinese': '中文',
    'spanish': 'Español',
    'japanese': '日本語',
    'korean': '한국어',
    'thai': 'ไทย',
    'french': 'Français',
    'russian': 'Русский',
    'portuguese': 'Português',
    'traditionalChinese': '繁體中文',
  },
  alerts: {
    'exitConfirm': '確定要退出嗎？',
    'exit': '退出',
    'deleteConfirm': '確定要刪除嗎？',
    'emptyTrashConfirm': '清空資源回收桶？所有項目將被永久刪除。',
    'error': '錯誤',
    'oops': '糟糕！出現了一些問題。',
    'tryAgain': '重試',
    'noFolders': '暫無資料夾',
    'noResults': '未找到與"{}"相關的結果',
    'startTyping': '輸入以開始搜尋',
    'searching': '搜尋中...',
    'itemsInTrash': '資源回收桶中的項目將在30天後永久刪除',
    'noItemsInTrash': '資源回收桶為空',
    'deleted': '已刪除 {}',
  },
  share: {
    'shareNote': '分享筆記',
    'shareAsText': '分享為文字',
    'shareAsImage': '分享為圖片',
    'exportAsMarkdown': '匯出為 Markdown',
  },
  editor: {
    'list': '清單',
    'image': '圖片',
    'draw': '繪圖',
    'checkList': '檢查清單',
    'format': '格式',
  },
  dateFormat: {
    'shortTime': 'HH:mm',  // 24小時制時間格式
    'shortDate': 'M月d日',  // 短日期格式
    'fullDate': 'yyyy年M月d日',  // 完整日期格式
    'fullDateTime': 'yyyy年M月d日 HH:mm',  // 完整日期時間格式
    'yesterday': '昨天',
    'today': '今天',
    'tomorrow': '明天',
    'daysAgo': '{}天前',
    'inDays': '{}天後',
    'charactersCount': '{}個字元',  // 字元計數格式
  },
);