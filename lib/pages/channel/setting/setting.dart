import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:matrix/matrix.dart' as link;

import '../../../components/components.dart';
import '../../../utils/functions.dart';
import '../../../utils/screen.dart';
import '../../../store/im.dart';
import '../../../store/theme.dart';
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
  late IMProvider im;
  late link.Room? room;
  late TabController _tabController;
  late PageController _pageController;
  // , '权限'
  late List<Widget> pageItems;

  @override
  void initState() {
    super.initState();
    im = context.read<IMProvider>();
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
      backgroundColor: constTheme.centerChannelBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "# ${getUserShortName(room!.getLocalizedDisplayname())}",
              height: 40.w,
              onBack: () {
                context.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "# ${getUserShortName(room!.getLocalizedDisplayname())}",
              height: 40.w,
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.pop();
              },
            ),
      body: Column(
        children: [
          Container(
            height: 35.w,
            color: constTheme.sidebarHeaderBg,
            padding: EdgeInsets.only(right: 300.w),
            child: TabBar(
              controller: _tabController,
              labelColor: constTheme.sidebarHeaderTextColor,
              unselectedLabelColor: constTheme.sidebarHeaderTextColor.withOpacity(0.6),
              labelStyle: TextStyle(fontSize: 13.w),
              unselectedLabelStyle: TextStyle(fontSize: 13.w),
              labelPadding: const EdgeInsets.only(left: 0, right: 0),
              tabs: titleList.map((e) => Tab(text: e)).toList(),
              dividerColor: Colors.transparent,
              indicator: MaterialIndicator(
                color: constTheme.sidebarTextActiveBorder,
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
