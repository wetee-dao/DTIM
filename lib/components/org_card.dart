// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:animated_checkmark/animated_checkmark.dart';

import '../models/models.dart';
import '../store/theme.dart';

class OrgCard extends StatelessWidget {
  final Org org;
  final Color? color;
  final bool selected;
  final Function(bool selected) onSelect;

  const OrgCard({
    Key? key,
    required this.org,
    this.color,
    this.selected = false,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 200.w,
      height: 250.w,
      duration: const Duration(milliseconds: 300),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: selected
        //       ? (color ?? ConstTheme.mentionBg)
        //       : (color ?? ConstTheme.sidebarBg.withAlpha(50)),
        //   width: 4.w,
        // ),
        color: ConstTheme.sidebarBg.withAlpha(50),
      ),
      child: InkWell(
        onTap: () => onSelect(!selected),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: -3.w,
              right: -3.w,
              top: -2.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    org.img ?? "",
                    width: 206.w,
                    fit: BoxFit.cover,
                    height: 150.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          org.name ?? "",
                          style: TextStyle(
                            color: ConstTheme.centerChannelColor,
                            fontSize: 16.w,
                          ),
                        ),
                        Text(
                          org.desc ?? "",
                          style: TextStyle(
                            color: ConstTheme.centerChannelColor,
                            fontSize: 12.w,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            selected ? Container(color: ConstTheme.sidebarTextActiveBorder.withOpacity(0.3)) : Container(),
            AnimatedCheckmark(
              active: selected,
              color: Colors.white,
              size: Size.square(90.w),
              weight: 10.w,
              style: CheckmarkStyle.round,
              duration: const Duration(milliseconds: 400),
            ),
          ],
        ),
      ),
    );
  }
}
