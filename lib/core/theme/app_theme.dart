import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
      ),
      splashFactory: InkRipple.splashFactory,
      brightness: Brightness.light,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }));

  static ThemeData get dark => ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: Colors.deepPurple,
      ).copyWith(
        brightness: Brightness.dark,
      ),
      splashFactory: InkRipple.splashFactory,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }));

  static ScrollBehavior get scrollBehavior {
    return const ScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(
      parent: AlwaysScrollableScrollPhysics(),
    )));
  }
}
