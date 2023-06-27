import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';

import 'package:dtim/application/store/theme.dart';
import 'dao/text.dart';

class AppCard extends StatelessWidget {
  final String icon;
  final Color? background;
  final String? label;
  final String? amount;
  const AppCard({Key? key, required this.icon, required this.label, required this.amount, this.background})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(minWidth: 350.w, maxWidth: 350.w, minHeight: 100.w, maxHeight: 100.w),
          padding: EdgeInsets.fromLTRB(15.w, 10.w, 15.w, 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            color: constTheme.centerChannelColor.withOpacity(0.05),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12.w)),
                child: Container(
                  width: 75.w,
                  height: 75.w,
                  color: background ?? constTheme.buttonBg,
                  child: Center(
                    child: Image.network(
                      icon,
                      height: 37.5.w,
                      fit: BoxFit.fitWidth,
                      // color: constTheme.centerChannelColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.w),
                    PrimaryText(
                      text: label!,
                      size: 15.w,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(height: 2.w),
                    Expanded(
                      child: PrimaryText(
                        text: amount!,
                        size: 12.w,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0.w,
          top: 0.w,
          child: Container(
            height: 30.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
            decoration: BoxDecoration(
              color: const Color.fromARGB(71, 54, 244, 108),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.w),
                bottomLeft: Radius.circular(10.w),
              ),
            ),
            child: const Text("DAPP"),
          ),
        ),
      ],
    );
  }
}
