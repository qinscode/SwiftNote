import 'translation_keys.dart';

const koKR = TranslationKeys(
  notes: {
    'title': '노트',
    'noNotes': '노트가 없습니다',
    'startTyping': '입력을 시작하세요',
    'untitled': '제목 없음',
    'noText': '내용 없음',
    'searchNotes': '노트 검색',
    'characters': '글자',
  },
  folders: {
    'title': '폴더',
    'newFolder': '새 폴더',
    'folderName': '폴더 이름',
    'all': '전체',
    'uncategorized': '미분류',
    'moveToFolder': '폴더로 이동',
    'createFolder': '폴더 만들기',
    'renameFolder': '폴더 이름 바꾸기',
    'deleteFolder': '폴더 삭제',
    'deleteFolderConfirm': '이 폴더를 삭제하시겠습니까? 모든 노트는 미분류로 이동됩니다.',
  },
  tasks: {
    'title': '할 일',
    'noTasks': '할 일이 없습니다',
    'addSubtask': "'Enter'를 눌러 하위 작업 추가",
    'setReminder': '알림 설정',
    'completed': '완료됨',
    'inProgress': '진행 중',
  },
  actions: {
    'create': '만들기',
    'rename': '이름 바꾸기',
    'delete': '삭제',
    'cancel': '취소',
    'save': '저장',
    'done': '완료',
    'share': '공유',
    'moveToTrash': '휴지통으로 이동',
    'restore': '복원',
    'deletePermanently': '영구 삭제',
    'tryAgain': '다시 시도',
  },
  settings: {
    'title': '설정',
    'style': '스타일',
    'fontSize': {
      'title': '글자 크기',
      'small': '작게',
      'medium': '보통',
      'large': '크게',
      'huge': '매우 크게',
    },
    'sort': {
      'title': '정렬',
      'byCreationDate': '생성일순',
      'byModificationDate': '수정일순',
    },
    'layout': {
      'title': '레이아웃',
      'list': '목록',
      'grid': '격자',
    },
    'darkMode': '다크 모드',
    'quickFeatures': '빠른 기능',
    'quickNotes': '빠른 노트',
    'reminders': '알림',
    'highPriorityReminders': '중요 알림',
    'highPriorityRemindersDesc': '무음 또는 방해 금지 모드에서도 소리 재생',
    'other': '기타',
    'privacyPolicy': '개인정보 처리방침',
    'dataSharing': '노트 제3자 데이터 공유 안내',
    'permissions': '권한 설정',
    'sortByDate': '날짜순 (최신순)',
    'sortByTitle': '제목순',
    'include': '포함',
    'folderExists': '동일한 이름의 폴더가 이미 존재합니다',
    'enterFolderName': '폴더 이름을 입력해주세요',
  },
  time: {
    'today': '오늘',
    'yesterday': '어제',
    'tomorrow': '내일',
    'startDate': '시작일',
    'endDate': '종료일',
    'to': '~',
    'at': '에',
  },
  language: {
    'title': '언어',
    'selectLanguage': '언어 선택',
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
    'exitConfirm': '종료하시겠습니까?',
    'exit': '종료',
    'deleteConfirm': '삭제하시겠습니까?',
    'emptyTrashConfirm': '휴지통을 비우시겠습니까? 모든 항목이 영구적으로 삭제됩니다.',
    'error': '오류',
    'oops': '문제가 발생했습니다.',
    'tryAgain': '다시 시도',
    'noFolders': '폴더가 없습니다',
    'noResults': '"{}"에 대한 검색 결과가 없습니다',
    'startTyping': '검색어를 입력하세요',
    'searching': '검색 중...',
    'itemsInTrash': '휴지통의 항목은 30일 후 영구적으로 삭제됩니다',
    'noItemsInTrash': '휴지통이 비어있습니다',
    'deleted': '{} 삭제됨',
  },
  share: {
    'shareNote': '노트 공유',
    'shareAsText': '텍스트로 공유',
    'shareAsImage': '이미지로 공유',
    'exportAsMarkdown': '마크다운으로 내보내기',
  },
  editor: {
    'list': '목록',
    'image': '이미지',
    'draw': '그리기',
    'checkList': '체크리스트',
    'format': '서식',
  },
  dateFormat: {
    'shortTime': 'HH:mm',  // 24시간제
    'shortDate': 'M월 d일',
    'fullDate': 'yyyy년 M월 d일',
    'fullDateTime': 'yyyy년 M월 d일 HH:mm',
    'yesterday': '어제',
    'today': '오늘',
    'tomorrow': '내일',
    'daysAgo': '{}일 전',
    'inDays': '{}일 후',
    'charactersCount': '{}자',
  },
);
