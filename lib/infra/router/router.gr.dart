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
    GovRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GovPage(),
      );
    },
    IntegrateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IntegratePage(),
      );
    },
    OrgRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrgPage(),
      );
    },
    CreateOrgRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateOrgPage(),
      );
    },
    WebviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CefView(),
      );
    },
    ImportSr25519keyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ImportSr25519KeyPage(),
      );
    },
    Sr25519keyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Sr25519KeyPage(),
      );
    },
    DaoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WorkPage(),
      );
    },
    PreloaderRoute.name: (routeData) {
      final args = routeData.argsAs<PreloaderRouteArgs>(
          orElse: () => const PreloaderRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PreloaderPage(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    PcRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PCPage(),
      );
    },
    SelectOrgRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectOrgPage(),
      );
    },
  };
}

/// generated route for
/// [GovPage]
class GovRoute extends PageRouteInfo<void> {
  const GovRoute({List<PageRouteInfo>? children})
      : super(
          GovRoute.name,
          initialChildren: children,
        );

  static const String name = 'GovRoute';

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
/// [CreateOrgPage]
class CreateOrgRoute extends PageRouteInfo<void> {
  const CreateOrgRoute({List<PageRouteInfo>? children})
      : super(
          CreateOrgRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateOrgRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CefView]
class WebviewRoute extends PageRouteInfo<void> {
  const WebviewRoute({List<PageRouteInfo>? children})
      : super(
          WebviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebviewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ImportSr25519KeyPage]
class ImportSr25519keyRoute extends PageRouteInfo<void> {
  const ImportSr25519keyRoute({List<PageRouteInfo>? children})
      : super(
          ImportSr25519keyRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImportSr25519keyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Sr25519KeyPage]
class Sr25519keyRoute extends PageRouteInfo<void> {
  const Sr25519keyRoute({List<PageRouteInfo>? children})
      : super(
          Sr25519keyRoute.name,
          initialChildren: children,
        );

  static const String name = 'Sr25519keyRoute';

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
/// [PreloaderPage]
class PreloaderRoute extends PageRouteInfo<PreloaderRouteArgs> {
  PreloaderRoute({
    Key? key,
    void Function(bool)? onResult,
    List<PageRouteInfo>? children,
  }) : super(
          PreloaderRoute.name,
          args: PreloaderRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'PreloaderRoute';

  static const PageInfo<PreloaderRouteArgs> page =
      PageInfo<PreloaderRouteArgs>(name);
}

class PreloaderRouteArgs {
  const PreloaderRouteArgs({
    this.key,
    this.onResult,
  });

  final Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'PreloaderRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [PCPage]
class PcRoute extends PageRouteInfo<void> {
  const PcRoute({List<PageRouteInfo>? children})
      : super(
          PcRoute.name,
          initialChildren: children,
        );

  static const String name = 'PcRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectOrgPage]
class SelectOrgRoute extends PageRouteInfo<void> {
  const SelectOrgRoute({List<PageRouteInfo>? children})
      : super(
          SelectOrgRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectOrgRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
