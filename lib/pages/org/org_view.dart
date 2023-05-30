import 'dart:async';
import 'package:asyou_app/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import '../../router.dart';
import '../../utils/screen/screen.dart';
import '../../components/components.dart';
import '../../components/popup.dart';
import '../../models/models.dart';
import '../../store/im.dart';
import '../../store/theme.dart';
import '../../utils/webrtc/action.dart';
import './org_menu.dart';

class OrgViewPage extends StatefulWidget {
  final double width;
  const OrgViewPage({Key? key, required this.width}) : super(key: key);

  @override
  State<OrgViewPage> createState() => _OrgViewPageState();
}

class _OrgViewPageState extends State<OrgViewPage> {
  late ExpandableController _controllerChannels;
  late ExpandableController _controllerStarred;
  late ExpandableController _controllerUsers;

  final BasePopupMenuController menuController = BasePopupMenuController();
  final StreamController<bool> menuStreamController = StreamController<bool>();
  late IMProvider im;
  late AccountOrg org;

  @override
  void initState() {
    super.initState();
    _controllerChannels = ExpandableController(initialExpanded: true);
    _controllerStarred = ExpandableController(initialExpanded: true);
    _controllerUsers = ExpandableController(initialExpanded: true);
    menuController.addListener(() {
      menuStreamController.add(menuController.menuIsShowing);
    });

    im = context.read<IMProvider>();
    org = im.currentState!.org;
  }

  @override
  void dispose() {
    super.dispose();
    _controllerChannels.dispose();
    _controllerStarred.dispose();
    _controllerUsers.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    var actions = [];
    if (im.currentState!.webrtcTool!.csession != null) {
      final callActions = CallAction(im.currentState!.webrtcTool!.csession!);
      actions = callActions.buildActionButtons();
    }
    printError(actions.toString());

    return Column(
      children: [
        moveWindow(
          Row(
            children: [
              SizedBox(width: 14.w),
              BasePopupMenu(
                verticalMargin: -1.w,
                horizontalMargin: 5.w,
                showArrow: false,
                controller: menuController,
                pressType: PressType.singleClick,
                position: PreferredPosition.bottomLeft,
                child: StreamBuilder<bool>(
                  stream: menuStreamController.stream,
                  initialData: false,
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return Container(
                      height: 35.w,
                      width: widget.width - 79.w,
                      padding: EdgeInsets.only(left: 10.w, right: 7.w, top: 2.w, bottom: 2.w),
                      decoration: BoxDecoration(
                        color: snapshot.data != null && snapshot.data!
                            ? constTheme.sidebarText.withOpacity(0.25)
                            : constTheme.sidebarText.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(3.w)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              org.orgName ?? "",
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: constTheme.sidebarText,
                                fontWeight: FontWeight.w800,
                                fontSize: 15.w,
                                height: 1.3,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: constTheme.sidebarText,
                            size: 18.w,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                menuBuilder: () => orgMenuRender(menuController, widget.width - 30.w),
              ),
              SizedBox(width: 10.w),
              InkWell(
                onTap: () {
                  showModelOrPage(context, "/search");
                },
                child: Container(
                  height: 35.w,
                  width: 35.w,
                  margin: EdgeInsets.only(left: 0.w, right: 15.w, top: 15.w, bottom: 15.w),
                  // padding: EdgeInsets.only(left: 10.w),
                  decoration: BoxDecoration(
                    color: constTheme.sidebarText.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(3.w)),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.search, size: 20.w, color: constTheme.sidebarText),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          color: constTheme.sidebarText.withOpacity(0.08),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 8.w, top: 10.w, bottom: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          L10n.of(context)!.channel,
                          style: TextStyle(
                            color: constTheme.sidebarText,
                            fontWeight: FontWeight.w800,
                            fontSize: 14.w,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            key: const Key("create_channel"),
                            onTap: () async {
                              showModelOrPage(
                                context,
                                "/create_channel",
                                width: 450.w,
                                height: 300.w,
                              );
                            },
                            child: Icon(
                              Icons.add,
                              size: 20.w,
                              color: constTheme.sidebarText,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _controllerChannels.toggle();
                              });
                            },
                            child: Icon(
                              _controllerChannels.expanded
                                  ? Icons.keyboard_arrow_down_outlined
                                  : Icons.keyboard_arrow_up_outlined,
                              size: 25.w,
                              color: constTheme.sidebarText.withAlpha(180),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ExpandablePanel(
                  key: const Key("room"),
                  controller: _controllerChannels,
                  collapsed: const SizedBox(),
                  expanded: const ChannelList(key: Key("ChannelList")),
                ),
                SizedBox(height: 5.w),
                Divider(
                  height: 1,
                  color: constTheme.sidebarText.withOpacity(0.05),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 8.w, top: 10.w, bottom: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          L10n.of(context)!.directChat,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14.w,
                            color: constTheme.sidebarText,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            key: const Key("create_private"),
                            onTap: () async {
                              showModelOrPage(
                                context,
                                "/create_private",
                                width: 550.w,
                                height: 0.7.sh,
                              );
                            },
                            child: Icon(
                              Icons.add,
                              size: 20.w,
                              color: constTheme.sidebarText,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _controllerUsers.toggle();
                              });
                            },
                            child: Icon(
                              _controllerUsers.expanded
                                  ? Icons.keyboard_arrow_down_outlined
                                  : Icons.keyboard_arrow_up_outlined,
                              size: 25.w,
                              color: constTheme.sidebarText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ExpandablePanel(
                  key: const Key("droom"),
                  controller: _controllerUsers,
                  collapsed: const SizedBox(),
                  expanded: const DirectChats(key: Key("DirectChats")),
                ),
                SizedBox(height: 5.w),
                Divider(
                  height: 1,
                  color: constTheme.sidebarText.withOpacity(0.05),
                ),
              ],
            ),
          ),
        ),
        if (actions.isNotEmpty)
          Divider(
            height: 1,
            color: constTheme.sidebarText.withOpacity(0.08),
          ),
        if (actions.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.w, bottom: 15.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "# calling",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14.w,
                          color: constTheme.sidebarText,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _controllerStarred.toggle();
                            });
                          },
                          child: Icon(
                            AppIcons.fangda,
                            size: 15.w,
                            color: constTheme.sidebarText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    UserAvatar(
                      key: Key(im.currentState!.user.id.toString()),
                      im.me!.address,
                      true,
                      40.w,
                      bg: constTheme.sidebarText.withOpacity(0.1),
                      color: constTheme.sidebarText,
                    ),
                  ],
                ),
                SizedBox(height: 10.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var i = 0; i < actions.length; i++)
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.w)), color: actions[i].backgroundColor),
                        margin: EdgeInsets.only(right: i != actions.length - 1 ? 5.w : 0),
                        child: IconButton(
                          iconSize: 18.w,
                          constraints: BoxConstraints(minWidth: 30.w, maxWidth: 30.w, minHeight: 30.w, maxHeight: 30.w),
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                          ),
                          padding: EdgeInsets.zero,
                          icon: actions[i].child,
                          color: Colors.white,
                          onPressed: () async {
                            actions[i].onPressed();
                          },
                        ),
                      ),
                    const Spacer(),
                    IconButton(
                      iconSize: 18.w,
                      constraints: BoxConstraints(minHeight: 35.w, maxHeight: 35.w),
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      icon: Text("挂断", style: TextStyle(fontSize: 14.w, color: constTheme.errorTextColor)),
                      color: Colors.white,
                      onPressed: () async {},
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
