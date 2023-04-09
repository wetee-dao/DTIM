import 'package:flutter/material.dart';

import '../store/theme.dart';
import '../components/popup.dart';
import '../utils/functions.dart';
import '../utils/identicon.dart';
import '../utils/screen.dart';
import 'name_with_emoji.dart';

class UserAvatar extends StatefulWidget {
  final String avatarSrc;
  final bool online;
  final double avatarWidth;
  final Color? bg;
  final Color? color;

  const UserAvatar(this.avatarSrc, this.online, this.avatarWidth, {Key? key, this.bg, this.color}) : super(key: key);

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  Widget? ctx;

  buildCtx(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final imgw = (widget.avatarWidth * 0.7).toInt();
    final imgbg = widget.color ?? constTheme.centerChannelColor;
    final boxBg = widget.bg ?? constTheme.centerChannelColor.withOpacity(0.1);
    final img = Identicon(fg: [imgbg.red, imgbg.green, imgbg.blue]).generate(widget.avatarSrc, size: 50);
    ctx = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w), color: boxBg),
      padding: EdgeInsets.all((widget.avatarWidth - imgw) / 2),
      alignment: Alignment.topLeft,
      child: Image.memory(
        img,
        cacheHeight: imgw,
        cacheWidth: imgw,
        fit: BoxFit.contain,
      ),
    );
    return ctx!;
  }

  @override
  void didUpdateWidget(covariant UserAvatar oldWidget) {
    if (oldWidget.color != widget.color) {
      ctx = null;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (ctx != null) {
      return ctx!;
    }
    return buildCtx(context);
  }
}

class UserAvatarWithPop extends StatefulWidget {
  final String id;
  final String name;
  final bool online;
  final double avatarWidth;
  final Color? bg;
  final Color? color;

  const UserAvatarWithPop(this.id, this.name, this.online, this.avatarWidth, {Key? key, this.bg, this.color})
      : super(key: key);

  @override
  State<UserAvatarWithPop> createState() => _UserAvatarWithPopState();
}

class _UserAvatarWithPopState extends State<UserAvatarWithPop> {
  final BasePopupMenuController menuController = BasePopupMenuController();

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final imgw = (widget.avatarWidth * 0.7).toInt();
    final imgbg = widget.color ?? constTheme.centerChannelColor.withOpacity(0.04);
    final boxBg = widget.bg ?? constTheme.centerChannelColor.withOpacity(0.04);
    final img = Identicon(fg: [imgbg.red, imgbg.green, imgbg.blue]).generate(getUserShortId(widget.id), size: 50);
    return BasePopupMenu(
      verticalMargin: 5.w,
      horizontalMargin: 0,
      showArrow: false,
      controller: menuController,
      position: PreferredPosition.bottomLeft,
      pressType: PressType.mouseHover,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w), color: boxBg),
        padding: EdgeInsets.all((widget.avatarWidth - imgw) / 2),
        alignment: Alignment.topLeft,
        child: Image.memory(
          img,
          width: imgw.toDouble(),
          height: imgw.toDouble(),
          fit: BoxFit.contain,
        ),
      ),
      menuBuilder: () => Container(
        width: 320.w,
        height: 170.w,
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color: constTheme.centerChannelBg,
          borderRadius: BorderRadius.all(Radius.circular(5.w)),
          border: Border.all(color: constTheme.centerChannelColor.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w, top: 2.w, bottom: 2.w),
                  child: UserAvatar(
                    getUserShortId(widget.id),
                    true,
                    65.w,
                    bg: constTheme.sidebarText.withOpacity(0.1),
                    color: constTheme.sidebarText,
                  ),
                ),
                WidgetUserNameEmoji(getUserShortName(widget.name), null),
              ],
            ),
            SizedBox(height: 15.w),
            Divider(
              height: 1.w,
              color: constTheme.centerChannelColor.withOpacity(0.1),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.w),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.chat, size: 20.w, color: constTheme.centerChannelColor.withOpacity(0.5)),
                    label: Text(
                      '消息',
                      style: TextStyle(fontSize: 14.w, color: constTheme.centerChannelColor.withOpacity(0.5)),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states) => constTheme.centerChannelBg),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.w, horizontal: 30.w)),
                      shadowColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
