import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../store/theme.dart';
import '../../utils/screen.dart';
import '../router.dart';

class ItemModel {
  String title;

  Function(String id)? onTap;
  ItemModel(this.title, {this.onTap});
}

List<List<ItemModel>> menuItems = [
  [
    // ItemModel('邀请人员'),
    // ItemModel('组织设置'),
    // ItemModel('成员管理'),
    ItemModel('离开组织', onTap: (id) {
      // rootNavigatorKey.currentContext?.push("/select_org");
    }),
  ],
  [
    ItemModel('创建或加入组织', onTap: (id) {
      rootNavigatorKey.currentContext?.push("/select_org");
    })
  ]
];

orgMenuRender(controller) {
  return Container(
    width: 200.w,
    margin: EdgeInsets.all(5.w),
    decoration: BoxDecoration(
      border: Border.all(color: ConstTheme.sidebarText.withOpacity(0.08)),
      color: ConstTheme.centerChannelBg,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 6.w,
        ),
      ],
      borderRadius: BorderRadius.circular(3.w),
    ),
    child: IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < menuItems.length; i++)
            for (var j = 0; j < menuItems[i].length; j++)
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  print("onTap");
                  controller.hideMenu();
                  if (menuItems[i][j].onTap != null) {
                    menuItems[i][j].onTap!.call("");
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    bottom: j == menuItems[i].length - 1 ? 15.w : 8.w,
                    top: j == 0 ? 15.w : 8.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: i != menuItems.length - 1 && j == menuItems[i].length - 1
                          ? BorderSide(color: ConstTheme.sidebarText.withOpacity(0.08))
                          : BorderSide.none,
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          menuItems[i][j].title,
                          style: TextStyle(
                            color: ConstTheme.centerChannelColor,
                            fontSize: 13.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ),
    ),
  );
}
