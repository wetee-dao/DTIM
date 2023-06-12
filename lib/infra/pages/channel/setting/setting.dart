// Copyright 2023 FluffyChat.
// This file is part of FluffyChat

// Licensed under the AGPL;
//
// https://gitlab.com/famedly/fluffychat
//

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:matrix/matrix.dart' as link;

import 'package:asyou_app/infra/components/components.dart';
import 'package:asyou_app/domain/utils/functions.dart';
import 'package:asyou_app/domain/utils/screen/screen.dart';
import 'package:asyou_app/application/store/im.dart';
import 'package:asyou_app/application/store/theme.dart';
import 'details.dart';
import 'encryption.dart';
import 'members.dart';

Map<String, int> typeMap = {
  "info": 0,
  "member": 1,
  "e2e": 2,
};

class ChannelSettingPage extends StatefulWidget {
  final String id;
  final String t;
  final Function? closeModel;
  const ChannelSettingPage({Key? key, required this.id, this.closeModel, required this.t}) : super(key: key);

  @override
  State<ChannelSettingPage> createState() => _ChannelSettingPageState();
}

class _ChannelSettingPageState extends State<ChannelSettingPage> with TickerProviderStateMixin {
  late AppCubit im;
  late link.Room? room;
  late TabController _tabController;
  late PageController _pageController;
  late List<Widget> pageItems;

  @override
  void initState() {
    super.initState();
    im = context.read<AppCubit>();
    room = im.currentState!.client.getRoomById(widget.id);

    pageItems = [
      ChatDetails(id: room!.id),
      ChannelMemberPage(id: room!.id),
      ChatEncryptionSettings(roomId: room!.id),
    ];

    final index = typeMap[widget.t];
    _tabController = TabController(vsync: this, length: pageItems.length, initialIndex: index!);
    _pageController = PageController(initialPage: index);
    _tabController.addListener(() {
      _pageController.jumpToPage(_tabController.index);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final titleList = <String>[L10n.of(context)!.chatDetal, L10n.of(context)!.chatMemeber, L10n.of(context)!.chatE2e];
    return Scaffold(
      backgroundColor: constTheme.sidebarHeaderBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "# ${getUserShortName(room!.getLocalizedDisplayname())}",
              onBack: () {
                context.router.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "# ${getUserShortName(room!.getLocalizedDisplayname())}",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.router.pop();
              },
            ),
      body: Column(
        children: [
          Container(
            height: 35.w,
            width: double.maxFinite,
            color: constTheme.sidebarHeaderBg,
            child: TabBar(
              controller: _tabController,
              labelColor: constTheme.sidebarHeaderTextColor,
              unselectedLabelColor: constTheme.sidebarHeaderTextColor.withOpacity(0.6),
              labelStyle: TextStyle(fontSize: 14.w),
              unselectedLabelStyle: TextStyle(fontSize: 14.w),
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              labelPadding: EdgeInsets.only(left: 12.w, right: 12.w),
              tabs: titleList.map((e) => Tab(text: e)).toList(),
              isScrollable: true,
              dividerColor: Colors.transparent,
              indicator: MaterialIndicator(
                color: constTheme.sidebarTextActiveBorder,
                strokeWidth: 10,
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {},
              itemCount: titleList.length,
              itemBuilder: (context, index) {
                return pageItems[index];
              },
            ),
          )
        ],
      ),
    );
  }
}
