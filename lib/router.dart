import 'package:asyou_app/pages/chain/import_sr25519_key.dart';
import 'package:asyou_app/pages/channel/invitation.dart';
import 'package:asyou_app/utils/screen.dart';

import 'pages/channel/create_private.dart';
import 'pages/channel/setting/setting.dart';
import 'pages/setting/setting.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'components/window/virtual_window_frame.dart';
import 'pages/channel/create.dart';
import 'pages/main_mobile.dart';
import 'pages/main_pc.dart';
import 'pages/chain/sr25519_key.dart';
import 'pages/search.dart';
import 'pages/select_org.dart';
import 'preloader.dart';
import 'store/theme.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
globalCtx() {
  return rootNavigatorKey.currentContext!;
}

routers() {
  return <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return renderFram(const PreloaderPage());
      },
    ),
    GoRoute(
      path: '/mobile',
      builder: (BuildContext context, GoRouterState state) {
        return renderFram(const MobilePage());
      },
    ),
    GoRoute(
      path: '/pc',
      builder: (BuildContext context, GoRouterState state) {
        return renderFram(const PCPage());
      },
    ),
    GoRoute(
      path: '/sr25519key',
      builder: (BuildContext context, GoRouterState state) {
        return renderFram(const Sr25519KeyPage());
      },
    ),
    GoRoute(
      path: '/importSr25519key',
      builder: (BuildContext context, GoRouterState state) {
        return renderFram(const ImportSr25519KeyPage());
      },
    ),
    GoRoute(
      path: '/select_org',
      builder: (BuildContext context, GoRouterState state) {
        return renderFram(const SelectOrgPage());
      },
    ),
    GoRoute(
      path: '/search',
      builder: (BuildContext context, GoRouterState state) {
        return renderFram(const SearchPage());
      },
    ),
    GoRoute(
      path: '/create_channel',
      builder: (BuildContext context, GoRouterState state) {
        return renderFram(const CreateChannelPage());
      },
    ),
    GoRoute(
      path: '/create_private',
      builder: (BuildContext context, GoRouterState state) {
        return renderFram(const CreatePrivatePage());
      },
    ),
    GoRoute(
      path: '/channel_setting/:id/:t',
      builder: (BuildContext context, GoRouterState state) {
        return renderFram(ChannelSettingPage(
          id: state.params['id'] ?? "",
          t: state.params['t'] ?? "",
        ));
      },
    ),
    GoRoute(
      path: '/invitation/:id',
      builder: (BuildContext context, GoRouterState state) {
        return renderFram(InvitationPage(id: state.params['id'] ?? ""));
      },
    ),
    GoRoute(
      path: '/setting',
      builder: (BuildContext context, GoRouterState state) {
        return renderFram(const SettingPage());
      },
    ),
  ];
}

getPage(String url, Function closeModel) {
  if (url == "/create_channel") {
    return CreateChannelPage(closeModel: closeModel);
  } else if (url == "/search") {
    return SearchPage(closeModel: closeModel);
  } else if (url == "/setting") {
    return SettingPage(closeModel: closeModel);
  } else if (url == "/create_private") {
    return CreatePrivatePage(closeModel: closeModel);
  } else if (url.indexOf("/channel_setting/") == 0) {
    var pstr = url.replaceAll("/channel_setting/", "");
    var ps = pstr.split("/");
    return ChannelSettingPage(
      closeModel: closeModel,
      id: Uri.decodeComponent(ps[0]),
      t: Uri.decodeComponent(ps[1]),
    );
  } else if (url.indexOf("/invitation/") == 0) {
    var pstr = url.replaceAll("/invitation/", "");
    var ps = pstr.split("/");
    return InvitationPage(
      closeModel: closeModel,
      id: Uri.decodeComponent(ps[0]),
    );
  }

  return const Center(child: Text("404"));
}

renderFram(Widget page) {
  if (isPc()) {
    return VirtualWindowFrame(child: page);
  }
  return page;
}

showModelOrPage(context, url, {double width = 520, double height = 550}) {
  if (isPc()) {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierColor: ConstTheme.sidebarHeaderTextColor.withOpacity(0.06),
      builder: (context) {
        var media = MediaQuery.of(context);
        var bottom = media.size.height - 30.w - height.w;
        return Container(
          margin: EdgeInsets.only(
            left: (media.size.width - width.w) / 2,
            right: (media.size.width - width.w) / 2,
            top: 30.w,
            bottom: bottom > 0 ? bottom : 40.w,
          ),
          width: width.w,
          height: height.w,
          decoration: BoxDecoration(
            color: ConstTheme.centerChannelBg,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8.w,
              ),
            ],
          ),
          child: getPage(url, () {
            Navigator.pop(context);
          }),
        );
      },
    );
  } else {
    context.push(url);
  }
}
