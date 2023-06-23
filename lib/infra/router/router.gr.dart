// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    Sr25519key.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Sr25519KeyPage(),
      );
    },
    ImportSr25519key.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ImportSr25519KeyPage(),
      );
    },
    SelectOrg.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectOrgPage(),
      );
    },
    DaoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WorkPage(),
      );
    },
    IntegrateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IntegratePage(),
      );
    },
    Preloader.name: (routeData) {
      final args =
          routeData.argsAs<PreloaderArgs>(orElse: () => const PreloaderArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PreloaderPage(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    OrgRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrgPage(),
      );
    },
    Pc.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PCPage(),
      );
    },
  };
}

/// generated route for
/// [Sr25519KeyPage]
class Sr25519key extends PageRouteInfo<void> {
  const Sr25519key({List<PageRouteInfo>? children})
      : super(
          Sr25519key.name,
          initialChildren: children,
        );

  static const String name = 'Sr25519key';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ImportSr25519KeyPage]
class ImportSr25519key extends PageRouteInfo<void> {
  const ImportSr25519key({List<PageRouteInfo>? children})
      : super(
          ImportSr25519key.name,
          initialChildren: children,
        );

  static const String name = 'ImportSr25519key';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectOrgPage]
class SelectOrg extends PageRouteInfo<void> {
  const SelectOrg({List<PageRouteInfo>? children})
      : super(
          SelectOrg.name,
          initialChildren: children,
        );

  static const String name = 'SelectOrg';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WorkPage]
class DaoRoute extends PageRouteInfo<void> {
  const DaoRoute({List<PageRouteInfo>? children})
      : super(
          DaoRoute.name,
          initialChildren: children,
        );

  static const String name = 'DaoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IntegratePage]
class IntegrateRoute extends PageRouteInfo<void> {
  const IntegrateRoute({List<PageRouteInfo>? children})
      : super(
          IntegrateRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntegrateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PreloaderPage]
class Preloader extends PageRouteInfo<PreloaderArgs> {
  Preloader({
    Key? key,
    void Function(bool)? onResult,
    List<PageRouteInfo>? children,
  }) : super(
          Preloader.name,
          args: PreloaderArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'Preloader';

  static const PageInfo<PreloaderArgs> page = PageInfo<PreloaderArgs>(name);
}

class PreloaderArgs {
  const PreloaderArgs({
    this.key,
    this.onResult,
  });

  final Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'PreloaderArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [OrgPage]
class OrgRoute extends PageRouteInfo<void> {
  const OrgRoute({List<PageRouteInfo>? children})
      : super(
          OrgRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrgRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PCPage]
class Pc extends PageRouteInfo<void> {
  const Pc({List<PageRouteInfo>? children})
      : super(
          Pc.name,
          initialChildren: children,
        );

  static const String name = 'Pc';

  static const PageInfo<void> page = PageInfo<void>(name);
}
