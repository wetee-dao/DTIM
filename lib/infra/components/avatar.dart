import 'package:dtim/infra/components/popup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/domain/utils/identicon.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'mxc_image.dart';
import 'name_with_emoji.dart';

class Avatar extends StatelessWidget {
  final Uri? mxContent;
  final String? name;
  final String id;
  final double size;
  final void Function()? onTap;
  static const double defaultSize = 44;
  final Client? client;
  final double fontSize;
  final Color? bg;
  final Color? color;

  const Avatar({
    required this.id,
    this.mxContent,
    this.name,
    this.size = defaultSize,
    this.onTap,
    this.client,
    this.fontSize = 18,
    Key? key,
    this.bg,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    var fallbackLetters = '@';
    final name = this.name;
    if (name != null) {
      if (name.runes.length >= 2) {
        fallbackLetters = String.fromCharCodes(name.runes, 0, 2);
      } else if (name.runes.length == 1) {
        fallbackLetters = name;
      }
    }
    final noPic = mxContent == null || mxContent.toString().isEmpty || mxContent.toString() == 'null';
    final textWidget = Center(
      child: Text(
        fallbackLetters,
        style: TextStyle(
          color: noPic ? Colors.white : null,
          fontSize: fontSize,
        ),
      ),
    );

    Widget container;

    if (!noPic) {
      container = ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: SizedBox(
          width: size,
          height: size,
          child: MxcImage(
            key: Key(mxContent.toString()),
            uri: mxContent,
            fit: BoxFit.cover,
            width: size,
            height: size,
            placeholder: (_) => textWidget,
            cacheKey: mxContent.toString(),
          ),
        ),
      );
    } else {
      container = id == ""
          ? CircleAvatar(
              radius: 3,
              child: Container(
                width: size,
                height: size,
                color: constTheme.centerChannelColor.withOpacity(0.1),
                child: textWidget,
              ),
            )
          : BaseAvatar(
              key: Key("BASE$id"),
              id,
              true,
              size,
              color: color,
              bg: bg,
            );
    }

    if (onTap == null) return container;
    return InkWell(
      onTap: onTap,
      child: container,
    );
  }
}

class BaseAvatar extends StatefulWidget {
  final String avatarSrc;
  final bool online;
  final double avatarWidth;
  final Color? bg;
  final Color? color;

  const BaseAvatar(this.avatarSrc, this.online, this.avatarWidth, {super.key, this.bg, this.color});

  @override
  State<BaseAvatar> createState() => _BaseAvatarState();
}

class _BaseAvatarState extends State<BaseAvatar> {
  Widget? ctx;

  buildCtx(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final imgw = (widget.avatarWidth * 0.7).toInt();
    final imgbg = widget.color ?? constTheme.centerChannelColor;
    final boxBg = widget.bg ?? constTheme.centerChannelColor.withOpacity(0.1);
    final img = Identicon(fg: [imgbg.red, imgbg.green, imgbg.blue]).generate(
      getUserShortId(widget.avatarSrc),
      scale: (widget.avatarWidth / 50).ceil(),
    );

    ctx = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: boxBg),
      padding: EdgeInsets.all((widget.avatarWidth - imgw) / 2),
      alignment: Alignment.topLeft,
      child: Image.memory(
        img,
        width: imgw.toDouble(),
        height: imgw.toDouble(),
        fit: BoxFit.contain,
      ),
    );
    return ctx!;
  }

  @override
  void didUpdateWidget(covariant BaseAvatar oldWidget) {
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

class BaseAvatarWithPop extends StatefulWidget {
  final String id;
  final String name;
  final bool online;
  final double avatarWidth;
  final Color? bg;
  final Color? color;
  final Uri? mxContent;

  const BaseAvatarWithPop(
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
  State<BaseAvatarWithPop> createState() => _BaseAvatarWithPopState();
}

class _BaseAvatarWithPopState extends State<BaseAvatarWithPop> {
  final BasePopupMenuController menuController = BasePopupMenuController();
  Widget? ctx;

  @override
  void didUpdateWidget(covariant BaseAvatarWithPop oldWidget) {
    if (oldWidget.color != widget.color) {
      ctx = null;
    }
    super.didUpdateWidget(oldWidget);
  }

  buildCtx(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return BasePopupMenu(
      verticalMargin: 5.w,
      horizontalMargin: 0,
      showArrow: false,
      controller: menuController,
      position: PreferredPosition.bottomLeft,
      pressType: kIsWeb ? PressType.singleClick : PressType.mouseHover,
      child: Avatar(
        id: widget.id,
        mxContent: widget.mxContent,
        size: widget.avatarWidth,
      ),
      menuBuilder: () => Container(
        width: 320.w,
        height: 150.w,
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
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w, top: 2.w, bottom: 2.w),
                    child: Avatar(
                      id: widget.id,
                      mxContent: widget.mxContent,
                      size: 50.w,
                    ),
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

  @override
  Widget build(BuildContext context) {
    if (ctx != null) {
      return ctx!;
    }
    return buildCtx(context);
  }
}
