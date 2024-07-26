// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DocCamRoute.name: (routeData) {
      final args = routeData.argsAs<DocCamRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DocCamScreen(
          key: args.key,
          images: args.images,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [DocCamScreen]
class DocCamRoute extends PageRouteInfo<DocCamRouteArgs> {
  DocCamRoute({
    Key? key,
    required List<String> images,
    List<PageRouteInfo>? children,
  }) : super(
          DocCamRoute.name,
          args: DocCamRouteArgs(
            key: key,
            images: images,
          ),
          initialChildren: children,
        );

  static const String name = 'DocCamRoute';

  static const PageInfo<DocCamRouteArgs> page = PageInfo<DocCamRouteArgs>(name);
}

class DocCamRouteArgs {
  const DocCamRouteArgs({
    this.key,
    required this.images,
  });

  final Key? key;

  final List<String> images;

  @override
  String toString() {
    return 'DocCamRouteArgs{key: $key, images: $images}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
