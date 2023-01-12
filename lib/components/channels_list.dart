import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart' as link;

import '../store/theme.dart';
import 'hover_list_item.dart';

channelsListView(
  List<link.Room> channelsList,
  String currentId,
  Function onSelect,
) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: channelsList.length,
    itemBuilder: (context, index) {
      return HoverListItem(
        color: currentId == channelsList[index].id ? ConstTheme.sidebarText.withOpacity(0.08) : Colors.transparent,
        hoverColor: ConstTheme.sidebarTextActiveBorder,
        onPressed: () async {
          onSelect(channelsList[index].id);
        },
        trailing: Container(
          margin: EdgeInsets.only(right: 12.w),
          child: Icon(Icons.adaptive.more, size: 17.w, color: ConstTheme.sidebarText.withAlpha(155)),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 2.w,
                color: currentId == channelsList[index].id ? ConstTheme.sidebarTextActiveBorder : Colors.transparent,
              ),
            ),
          ),
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 12.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.private_connectivity,
                size: 24.w,
                color: ConstTheme.sidebarText.withAlpha(155),
              ),
              SizedBox(width: 8.w),
              Text(
                channelsList[index].name,
                style: TextStyle(
                  fontSize: 14.w,
                  fontWeight: FontWeight.normal,
                  color: ConstTheme.sidebarText.withAlpha(155),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
  // ListTile(trailing: ,)
}
