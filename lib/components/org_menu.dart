import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:flutter/material.dart';

import '../../store/theme.dart';

class ItemModel {
  String title;

  ItemModel(this.title);
}

List<List<ItemModel>> menuItems = [
  [
    ItemModel('邀请人员'),
    ItemModel('组织设置'),
    ItemModel('成员管理'),
    ItemModel('离开组织'),
  ],
  [ItemModel('创建组织')]
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
