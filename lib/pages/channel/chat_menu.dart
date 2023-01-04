import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:flutter/material.dart';

import '../../store/theme.dart';

class ItemModel {
  String title;

  ItemModel(this.title);
}

List<List<ItemModel>> menuItems = [
  [ItemModel('查看详情')],
  [ItemModel('移动至...')],
  [ItemModel('通知偏好'), ItemModel('静音频道')],
  [ItemModel('邀请成员'), ItemModel('成员管理')],
  [
    ItemModel('编辑频道标签'),
    ItemModel('重命名频道'),
    ItemModel('转换为私有频道'),
    ItemModel('归档频道'),
  ],
  [ItemModel('离开频道')]
];

menuRender(controller) {
  return Container(
    width: 200.w,
    margin: EdgeInsets.all(5.w),
    decoration: BoxDecoration(
      border: Border.all(color: ConstTheme.sidebarText.withOpacity(0.08)),
      borderRadius: BorderRadius.circular(3.w),
      color: ConstTheme.centerChannelBg,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 6.w,
        ),
      ],
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
                            fontSize: 12.w,
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
