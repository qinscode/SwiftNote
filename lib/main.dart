// lib/main.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Models
import 'models/notes_model.dart';
import 'models/tasks_model.dart';
import 'models/folder_model.dart';
import 'models/settings_model.dart';
import 'models/trash_model.dart';

// Services
import 'services/storage_service.dart';
import 'services/search_service.dart';

// Screens
import 'screens/home_screen.dart';

// Theme
// import 'theme/app_theme.dart';


// TODO: REFACTOR

void main() async {
  // 确保Flutter绑定初始化
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化存储服务
  final storageService = await StorageService.initialize();

  // 设置系统UI样式
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // 修改为白色
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white, // 已经是白色
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // 运行应用
  runApp(MyApp(storageService: storageService));
}

class MyApp extends StatelessWidget {
  final StorageService storageService;

  const MyApp({
    super.key,
    required this.storageService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // 注册所有需要的Provider
        ChangeNotifierProvider(
          create: (_) => NotesModel(storageService),
        ),
        ChangeNotifierProvider(
          create: (_) => TasksModel(storageService),
        ),
        ChangeNotifierProvider(
          create: (_) => FolderModel(storageService),
        ),
        ChangeNotifierProvider(
          create: (_) => SettingsModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => TrashModel(storageService),
        ),
        // 注册Search Service
        Provider(
          create: (_) => SearchService(),
        ),
      ],
      child: Consumer<SettingsModel>(
        builder: (context, settings, _) {
          return MaterialApp(
            title: 'Notes App',
            theme: ThemeData(
              // 基础背景色设置
              scaffoldBackgroundColor: Colors.white,
              canvasColor: Colors.white,
              dialogBackgroundColor: Colors.white,
              cardColor: Colors.white,
              
              // 颜色方案
              colorScheme: const ColorScheme.light(
                surface: Colors.white,
                onSurface: Colors.black,
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
              
              // AppBar 主题
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              // 底部导航栏主题
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              
              // 弹窗主题
              dialogTheme: const DialogTheme(
                backgroundColor: Colors.white,
              ),
              
              // 卡片主题
              cardTheme: const CardTheme(
                color: Colors.white,
                elevation: 1,
              ),
              
              // 弹出菜单主题
              popupMenuTheme: const PopupMenuThemeData(
                color: Colors.white,
              ),
              
              // 底部Sheet主题
              bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.white,
              ),
              
              // 导航栏主题
              navigationBarTheme: NavigationBarThemeData(
                labelTextStyle: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return const TextStyle(
                      color: Colors.blue,
                      fontSize: 12,  // 增加字体大小
                      fontWeight: FontWeight.w700,  // 加粗字体
                    );
                  }
                  return const TextStyle(
                    color: Colors.grey,
                    fontSize: 12        ,  // 增加字体大小
                    fontWeight: FontWeight.w600,  // 未选中时也稍微加粗
                  );
                }),
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                height: 65,  // 设置导航栏高度
                iconTheme: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return const IconThemeData(
                      size: 25,  // 增加图标大小
                      color: Colors.blue,
                    );
                  }
                  return const IconThemeData(
                    size: 25,  // 增加图标大小
                    color: Colors.grey,
                  );
                }),
              ),
            ),
            darkTheme: ThemeData(
              // 复制上面相同的配置
              scaffoldBackgroundColor: Colors.white,
              canvasColor: Colors.white,
              dialogBackgroundColor: Colors.white,
              cardColor: Colors.white,
              
              colorScheme: const ColorScheme.light(
                surface: Colors.white,
                onSurface: Colors.black,
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
              
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              
              dialogTheme: const DialogTheme(
                backgroundColor: Colors.white,
              ),
              
              cardTheme: const CardTheme(
                color: Colors.white,
                elevation: 1,
              ),
              
              popupMenuTheme: const PopupMenuThemeData(
                color: Colors.white,
              ),
              
              bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.white,
              ),
            ),
            themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
            builder: (context, child) {
              return MediaQuery(
                // 设置文字缩放比例
                data: MediaQuery.of(context).copyWith(
                  textScaler: TextScaler.linear(settings.textScaleFactor),
                ),
                child: child!,
              );
            },
            // 添加本地化支持
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('zh', 'CN'),
            ],
          );
        },
      ),
    );
  }
}

// 定义一个全局键用于访问Navigator
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// 定义一个用于处理返回按钮的Wrapper Widget
class BackButtonInterceptor extends StatelessWidget {
  final Widget child;

  const BackButtonInterceptor({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        
        // 获取当前路由信息
        final currentRoute = ModalRoute.of(context);
        if (currentRoute?.isFirst ?? false) {
          // 在异步操作前捕获 context
          final navigator = Navigator.of(context);
          // 如果是首页，显示退出确认对话框
          final shouldExit = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit App?'),
              content: const Text('Are you sure you want to exit?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Exit'),
                ),
              ],
            ),
          );
          if (shouldExit ?? false) {
            // 使用之前捕获的 navigator
            navigator.pop();
          }
        }
      },
      child: child,
    );
  }
}

// 错误处理Widget
class ErrorBoundary extends StatefulWidget {
  final Widget child;

  const ErrorBoundary({
    super.key,
    required this.child,
  });

  @override
  State<ErrorBoundary> createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  Error? _error;

  @override
  void initState() {
    super.initState();
    ErrorWidget.builder = (FlutterErrorDetails details) {
      setState(() {
        _error = details.exception as Error;
      });
      return Container(); // 返回空容器防止更多错误
    };
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Material(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.exclamationmark_triangle,
                  color: Colors.red,
                  size: 48,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Oops! Something went wrong.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _error.toString(),
                  style: const TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _error = null;
                    });
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return widget.child;
  }
}
