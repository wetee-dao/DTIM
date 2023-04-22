import 'package:flutter/material.dart';

import '../../store/theme.dart';

class PrimaryText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final String text;
  final double height;
  final Color? color;
  final TextAlign? textAlign;

  const PrimaryText({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.size = 20,
    this.height = 1.4,
    this.color,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Text(
      text,
      style: TextStyle(
        color: color ?? constTheme.centerChannelColor,
        height: height,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
