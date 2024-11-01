import 'translation_keys.dart';

const enUS = TranslationKeys(
  dialog: {
    'enterFolderName':'enterFolderName',
    'folderExists':'folderExists'
  },
  notes: {
    'title': 'Notes',
    'noNotes': 'No notes yet',
    'startTyping': 'Start typing',
    'untitled': 'Untitled',
    'noText': 'No text',
    'searchNotes': 'Search notes',
    'characters': 'characters',
  },
  folders: {
    'title': 'Folders',
    'newFolder': 'New folder',
    'folderName': 'Folder name',
    'all': 'All',
    'uncategorized': 'Uncategorized',
    'moveToFolder': 'Move to folder',
    'createFolder': 'Create folder',
    'renameFolder': 'Rename folder',
    'deleteFolder': 'Delete folder',
    'deleteFolderConfirm': 'Are you sure you want to delete this folder? All notes will be moved to Uncategorized.',
  },
  tasks: {
    'title': 'Tasks',
    'noTasks': 'No tasks here yet',
    'addSubtask': "Tap 'Enter' to create subtasks",
    'setReminder': 'Set reminder',
    'completed': 'Completed',
    'inProgress': 'In Progress',
  },
  actions: {
    'create': 'Create',
    'rename': 'Rename',
    'delete': 'Delete',
    'cancel': 'Cancel',
    'save': 'Save',
    'done': 'Done',
    'share': 'Share',
    'moveToTrash': 'Move to trash',
    'restore': 'Restore',
    'deletePermanently': 'Delete Permanently',
  },
  settings: {
    'title': 'Settings',
    'style': 'Style',
    'fontSize': {
      'title': 'Font Size',
      'small': 'Small',
      'medium': 'Medium',
      'large': 'Large',
      'huge': 'Huge',
    },
    'sort': {
      'title': 'Sort',
      'byCreationDate': 'By Creation Date',
      'byModificationDate': 'By Modification Date',
    },
    'layout': {
      'title': 'Layout',
      'list': 'List',
      'grid': 'Grid',
    },
    'darkMode': 'Dark Mode',
    'quickFeatures': 'Quick features',
    'quickNotes': 'Quick notes',
    'reminders': 'Reminders',
    'highPriorityReminders': 'High-priority reminders',
    'highPriorityRemindersDesc': 'Play sound even when Silent or DND mode is on',
    'other': 'OTHER',
    'privacyPolicy': 'Privacy Policy',
    'dataSharing': 'Notes Third Party Data Sharing Statement',
    'permissions': 'Permissions details',
    'sortByDate': 'Date (Newest first)',
    'sortByTitle': 'Title',
    'include': 'Include',
    'folderExists': 'A folder with this name already exists',
    'enterFolderName': 'Please enter a folder name',
  },
  time: {
    'today': 'Today',
    'yesterday': 'Yesterday',
    'tomorrow': 'Tomorrow',
    'startDate': 'Start Date',
    'endDate': 'End Date',
    'to': 'to',
    'at': 'at',
  },
  language: {
    'title': 'Language',
    'selectLanguage': 'Select Language',
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
    'exitConfirm': 'Are you sure you want to exit?',
    'exit': 'Exit',
    'deleteConfirm': 'Are you sure you want to delete?',
    'emptyTrashConfirm': 'Empty trash? All items will be permanently deleted.',
    'error': 'Error',
    'oops': 'Oops! Something went wrong.',
    'tryAgain': 'Try Again',
    'noFolders': 'No folders yet',
    'noResults': 'No results found for "{}"',
    'startTyping': 'Start typing to search',
    'searching': 'Searching...',
    'itemsInTrash': 'Items in the trash are kept for 30 days before being permanently deleted',
    'noItemsInTrash': 'No items in trash',
    'deleted': 'Deleted {}',
  },
  share: {
    'shareNote': 'Share note',
    'shareAsText': 'Share as text',
    'shareAsImage': 'Share as image',
    'exportAsMarkdown': 'Export as Markdown',
  },
  editor: {
    'list': 'List',
    'image': 'Image',
    'draw': 'Draw',
    'checkList': 'Check List',
    'format': 'Format',
  },
  dateFormat: {
    'shortTime': 'h:mm a',  // 12小时制时间格式
    'shortDate': 'MMM d',   // 短日期格式
    'fullDate': 'MMMM d, yyyy',  // 完整日期格式
    'fullDateTime': 'MMMM d, yyyy h:mm a',  // 完整日期时间格式
    'yesterday': 'Yesterday',
    'today': 'Today',
    'tomorrow': 'Tomorrow',
    'daysAgo': '{} days ago',
    'inDays': 'in {} days',
    'charactersCount': '{} characters',  // 字符计数格式
  },
);
