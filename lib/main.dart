import 'package:doc_reader/core/router/app_router.dart';
import 'package:doc_reader/core/theme/app_theme.dart';
import 'package:doc_reader/injection.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        builder: (context, _) {
          var child = _!;
          child = Toast(
            navigatorKey: getIt.get<AppRouter>().navigatorKey,
            child: child,
          );
          return child;
        },
        title: 'Doc reader',
        darkTheme: AppTheme.dark,
        scrollBehavior: AppTheme.scrollBehavior,
        themeMode: ThemeMode.dark,
        routerConfig: getIt.get<AppRouter>().config(),
      ),
    );
  }
}
