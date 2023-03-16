import 'package:asyou_app/utils/screen.dart';

import 'pages/channel/create_private.dart';
import 'pages/setting/setting.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'components/window/virtual_window_frame.dart';
import 'pages/channel/create.dart';
import 'pages/channel/members.dart';
import 'pages/channel/rename.dart';
import 'pages/main_mobile.dart';
import 'pages/main_pc.dart';
import 'pages/chain/sr25519_key.dart';
import 'pages/search.dart';
import 'pages/select_org.dart';
import 'preloader.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

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
      path: '/rename_channel/:id',
      builder: (BuildContext context, GoRouterState state) {
        return renderFram(RenameChannelPage(id: state.params['id'] ?? ""));
      },
    ),
    GoRoute(
      path: '/channel_members/:id',
      builder: (BuildContext context, GoRouterState state) {
        return renderFram(ChannelMemberPage(id: state.params['id'] ?? ""));
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

renderFram(Widget page) {
  if (isPc()) {
    return VirtualWindowFrame(child: page);
  }
  return page;
}
