import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:flutter/material.dart';

import '../store/theme.dart';
import '../utils/identicon.dart';

class UserAvatar extends StatelessWidget {
  final String avatarSrc;
  final bool online;
  final double avatarWidth;
  const UserAvatar(this.avatarSrc, this.online, this.avatarWidth, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imgw = (avatarWidth * 0.7).toInt();
    var imgbg = ConstTheme.centerChannelColor;
    var img = Identicon(fg: [imgbg.red, imgbg.green, imgbg.blue]).generate(avatarSrc, size: 50);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: ConstTheme.centerChannelColor.withOpacity(0.1),
      ),
      padding: EdgeInsets.all((avatarWidth - imgw) / 2),
      alignment: Alignment.topLeft,
      child: Image.memory(
        img,
        width: imgw.toDouble(),
        height: imgw.toDouble(),
        fit: BoxFit.contain,
      ),
    );
  }
}

Widget userAvatarWidget(
  String avatarSrc,
  bool online,
  double avatarWidth,
  double avatarHeight,
) {
  var imgw = (avatarWidth * 0.8).toInt();
  var imgbg = ConstTheme.centerChannelColor;
  var img = Identicon(fg: [imgbg.red, imgbg.green, imgbg.blue]).generate(avatarSrc, size: imgw);
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.w),
      color: ConstTheme.centerChannelColor.withOpacity(0.1),
    ),
    padding: EdgeInsets.only(
      left: avatarWidth * 0.1,
      top: avatarWidth * 0.1,
      bottom: avatarWidth * 0.04,
      right: avatarWidth * 0.04,
    ),
    alignment: Alignment.topLeft,
    child: Image.memory(
      img,
      width: imgw.toDouble(),
      height: imgw.toDouble(),
      fit: BoxFit.contain,
    ),
  );
}
