import 'package:flutter/material.dart';

import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/application/store/theme.dart';

class SiderBarItem extends StatelessWidget {
  final IconData? icon;
  final String? img;
  final String name;
  final bool selected;
  final Function? onTap;
  final Color? bg;

  const SiderBarItem(this.name, {super.key, this.icon, required this.selected, this.onTap, this.img, this.bg});

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final bgc = bg ?? constTheme.sidebarText.withOpacity(0.1);
    return Padding(
      padding: EdgeInsets.only(bottom: 5.w),
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          width: 52.w,
          padding: EdgeInsets.only(top: 10.w, bottom: 6.w),
          decoration: BoxDecoration(
            color: selected ? bgc : Colors.transparent,
            borderRadius: BorderRadius.circular(6.w),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Icon(
                      icon!,
                      color: constTheme.sidebarText,
                      size: 16.w,
                    )
                  : (img != null
                      ? Image.network(
                          img!,
                          width: 16.w,
                          height: 16.w,
                          fit: BoxFit.cover,
                          color: constTheme.sidebarText,
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: 16.w,
                              height: 16.w,
                              decoration: BoxDecoration(
                                color: constTheme.sidebarText,
                                borderRadius: BorderRadius.all(Radius.circular(3.w)),
                              ),
                              child: Center(
                                child: Text(
                                  name[0],
                                  style: TextStyle(
                                    fontSize: 12.w,
                                    color: constTheme.sidebarBg,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return Container(
                              width: 20.w,
                              height: 20.w,
                              decoration: BoxDecoration(
                                color: constTheme.sidebarText,
                                borderRadius: BorderRadius.all(Radius.circular(3.w)),
                              ),
                              child: Center(
                                child: Text(
                                  name[0],
                                  style: TextStyle(
                                    fontSize: 12.w,
                                    color: constTheme.sidebarBg,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : SizedBox(
                          width: 20.w,
                          height: 20.w,
                        )),
              // SizedBox(height: 3.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                height: 14.w,
                child: Text(
                  name.split("&").first,
                  style: TextStyle(
                    color: constTheme.sidebarText,
                    fontSize: 10.w,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
