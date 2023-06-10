import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../pages/chain/import_sr25519_key.dart';
import '../pages/chain/sr25519_key.dart';
import '../pages/main_pc.dart';
import '../pages/select_org.dart';
import '../preloader.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter  implements AutoRouteGuard {

  AuthService authService;

  AppRouter(this.authService);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (authService.isAuthenticated || resolver.routeName == Preloader.name) {
      resolver.next();
    } else {
      resolver.redirect(
        Preloader(onResult: (didLogin) {
          resolver.resolveNext(didLogin, reevaluateNext: false);
        }),
      );
    }
  }

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(path: '/', page: Preloader.page),
      AutoRoute(path: '/pc/:app', page: Pc.page),
      AutoRoute(path: '/sr25519key', page: Sr25519key.page),
      AutoRoute(path: '/importSr25519key', page: ImportSr25519key.page),
      AutoRoute(path: '/select_org', page: SelectOrg.page),
    ];
  }
}

// routers() {
//   return <GoRoute>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const PreloaderPage();
//       },
//     ),
//     GoRoute(
//       path: '/mobile',
//       builder: (BuildContext context, GoRouterState state) {
//         return const MobilePage();
//       },
//     ),
//     GoRoute(
//       path: '/pc/:app',
//       builder: (BuildContext context, GoRouterState state) {
//         return const PCPage();
//       },
//     ),
//     GoRoute(
//       path: '/sr25519key',
//       builder: (BuildContext context, GoRouterState state) {
//         return const Sr25519KeyPage();
//       },
//     ),
//     GoRoute(
//       path: '/importSr25519key',
//       builder: (BuildContext context, GoRouterState state) {
//         return const ImportSr25519KeyPage();
//       },
//     ),
//     GoRoute(
//       path: '/select_org',
//       builder: (BuildContext context, GoRouterState state) {
//         final auto = state.queryParams["auto"];
//         return SelectOrgPage(auto: auto ?? "");
//       },
//     ),
//     GoRoute(
//       path: '/search',
//       builder: (BuildContext context, GoRouterState state) {
//         return const SearchPage();
//       },
//     ),
//     GoRoute(
//       path: '/create_channel',
//       builder: (BuildContext context, GoRouterState state) {
//         return const CreateChannelPage();
//       },
//     ),
//     GoRoute(
//       path: '/create_private',
//       builder: (BuildContext context, GoRouterState state) {
//         return const CreatePrivatePage();
//       },
//     ),
//     GoRoute(
//       path: '/channel_setting/:id/:t',
//       builder: (BuildContext context, GoRouterState state) {
//         return ChannelSettingPage(
//           id: state.params['id'] ?? "",
//           t: state.params['t'] ?? "",
//         );
//       },
//     ),
//     GoRoute(
//       path: '/invitation/:id',
//       builder: (BuildContext context, GoRouterState state) {
//         return InvitationPage(id: state.params['id'] ?? "");
//       },
//     ),
//     GoRoute(
//       path: '/setting',
//       builder: (BuildContext context, GoRouterState state) {
//         return const SettingPage();
//       },
//     ),
//     GoRoute(
//       path: '/create_roadmap',
//       builder: (BuildContext context, GoRouterState state) {
//         return const CreateRoadMapPage();
//       },
//     ),
//     GoRoute(
//       path: '/join_dao',
//       builder: (BuildContext context, GoRouterState state) {
//         return const JoinDaoPage();
//       },
//     ),
//     GoRoute(
//       path: '/create_dao_project',
//       builder: (BuildContext context, GoRouterState state) {
//         return const CreateProjectPage();
//       },
//     ),
//     GoRoute(
//       path: '/referendum_vote/:id',
//       builder: (BuildContext context, GoRouterState state) {
//         return ReferendumVotePage(id: state.params['id'] ?? "");
//       },
//     ),
//     GoRoute(
//       path: '/create_task/:project_id',
//       builder: (BuildContext context, GoRouterState state) {
//         return CreateTaskPage(projectId: state.params['project_id'] ?? "");
//       },
//     ),
//     GoRoute(
//       path: '/join_task/:project_id/:id',
//       builder: (BuildContext context, GoRouterState state) {
//         return JoinTaskPage(id: state.params['id'] ?? "", projectId: state.params['project_id'] ?? "");
//       },
//     ),
//     GoRoute(
//       path: '/task_info/:project_id/:id',
//       builder: (BuildContext context, GoRouterState state) {
//         return TaskInfoPage(id: state.params['id'] ?? "", projectId: state.params['project_id'] ?? "");
//       },
//     ),
//     GoRoute(
//       path: '/make_review/:project_id/:id',
//       builder: (BuildContext context, GoRouterState state) {
//         return MakeReviewPage(id: state.params['id'] ?? "", projectId: state.params['project_id'] ?? "");
//       },
//     ),
//     GoRoute(
//       path: '/apply_project_funding/:project_id',
//       builder: (BuildContext context, GoRouterState state) {
//         return ApplyProjectFundingPage(projectId: state.params['project_id'] ?? "");
//       },
//     ),
//   ];
// }

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  bool _isVerified = false;

  bool get isVerified => _isVerified;

  set isVerified(bool value) {
    _isVerified = value;
    notifyListeners();
  }

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    if (!_isAuthenticated) {
      _isVerified = false;
    }
    notifyListeners();
  }

  void loginAndVerify() {
    _isAuthenticated = true;
    _isVerified = true;
    notifyListeners();
  }
}