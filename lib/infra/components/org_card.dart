// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:animated_checkmark/animated_checkmark.dart';

import 'package:asyou_app/domain/models/models.dart';
import 'package:asyou_app/application/store/theme.dart';
import 'package:asyou_app/domain/utils/screen/screen.dart';

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
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return AnimatedContainer(
      width: 150.w,
      height: 200.w,
      duration: const Duration(milliseconds: 300),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: selected
        //       ? (color ?? constTheme.mentionBg)
        //       : (color ?? constTheme.sidebarBg.withAlpha(50)),
        //   width: 4.w,
        // ),
        color: constTheme.centerChannelColor.withOpacity(0.1),
      ),
      child: InkWell(
        key: Key("${org.hash}Card"),
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
                  Container(
                    width: 206.w,
                    height: 130.w,
                    decoration: BoxDecoration(
                      color: org.metaData!.color != null ? hexToColor(org.metaData!.color!) : Colors.transparent,
                    ),
                    child: Image.network(
                      org.metaData!.img ?? "",
                      width: 206.w,
                      fit: BoxFit.contain,
                      height: 150.w,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          org.name ?? "",
                          style: TextStyle(
                            color: constTheme.centerChannelColor,
                            fontSize: 16.w,
                          ),
                        ),
                        Text(
                          org.desc ?? "",
                          style: TextStyle(
                            color: constTheme.centerChannelColor,
                            fontSize: 12.w,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            selected ? Container(color: constTheme.sidebarTextActiveBorder.withOpacity(0.3)) : Container(),
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
