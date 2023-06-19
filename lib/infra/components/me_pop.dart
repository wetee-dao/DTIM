import 'package:dtim/application/store/app/app.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/infra/components/popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router/pop_router.dart';
import 'avatar.dart';

class MePop extends StatefulWidget {
  final String id;
  final String name;
  final bool online;
  final double avatarWidth;
  final Color? bg;
  final Color? color;
  final Uri? mxContent;

  const MePop(
    this.id,
    this.name,
    this.online,
    this.avatarWidth, {
    Key? key,
    this.bg,
    this.color,
    this.mxContent,
  }) : super(key: key);

  @override
  State<MePop> createState() => _MePopState();
}

class _MePopState extends State<MePop> {
  final BasePopupMenuController menuController = BasePopupMenuController();

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return BasePopupMenu(
      verticalMargin: 5.w,
      horizontalMargin: -3.w,
      showArrow: false,
      controller: menuController,
      position: PreferredPosition.rightTop,
      pressType: PressType.singleClick,
      child: Avatar(
        bg: widget.bg,
        color: widget.color,
        id: widget.id,
        mxContent: widget.mxContent,
        size: 40.w,
      ),
      menuBuilder: () => Container(
        width: 270.w,
        // height: 170.w,
        padding: EdgeInsets.only(top: 15.w, left: 15.w, right: 15.w),
        decoration: BoxDecoration(
          color: constTheme.centerChannelBg,
          borderRadius: BorderRadius.all(Radius.circular(5.w)),
          border: Border.all(color: constTheme.centerChannelColor.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w, top: 2.w, bottom: 2.w),
                    child: Avatar(
                      id: widget.id,
                      mxContent: widget.mxContent,
                      size: 80.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 90.w,
                  width: 145.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1.w),
                      Text(
                        getUserShortName(widget.name),
                        style: TextStyle(fontSize: 18.w, color: constTheme.centerChannelColor),
                      ),
                      Expanded(
                        child: Text(
                          widget.id,
                          style: TextStyle(fontSize: 12.w, height: 1.2, color: constTheme.centerChannelColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.w),
            Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    menuController.hideMenu();
                    showModelOrPage(context, "/user_setting");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.w),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: constTheme.centerChannelColor.withOpacity(0.05))),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '账户设置',
                          style: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14.w,
                          color: constTheme.centerChannelColor,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    menuController.hideMenu();
                    showModelOrPage(context, "/kyc");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.w),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: constTheme.centerChannelColor.withOpacity(0.05))),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '实名认证',
                          style: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.5),
                            borderRadius: BorderRadius.all(Radius.circular(5.w)),
                          ),
                          child: Text(
                            'Not authenticated',
                            style: TextStyle(fontSize: 10.w, color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14.w,
                          color: constTheme.centerChannelColor,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    final im = context.read<AppCubit>();
                    menuController.hideMenu();
                    im.logout();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.w),
                    child: Row(
                      children: [
                        Text(
                          '退出登陆',
                          style: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14.w,
                          color: constTheme.centerChannelColor,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
