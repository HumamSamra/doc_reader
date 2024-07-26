import 'package:auto_route/auto_route.dart';
import 'package:doc_reader/features/doc_cam/doc_cam.imports.dart';
import 'package:doc_reader/features/home/home.imports.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          path: '/home',
        ),
        AutoRoute(
          page: DocCamRoute.page,
          path: '/doc-cam',
        ),
      ];
}
