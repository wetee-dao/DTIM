import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart' as link;

import '../components/name_with_emoji.dart';
import '../components/user_avatar.dart';
import '../store/theme.dart';
import '../utils/screen.dart';
import 'hover_list_item.dart';

// ignore: non_constant_identifier_names
Widget DirectChats(List<link.Room> channelsList, String currentId, Function(String) onSelect) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: channelsList.length,
    itemBuilder: (context, index) {
      var room = channelsList[index];
      final displayname = room.getLocalizedDisplayname();
      return HoverListItem(
        color: currentId == channelsList[index].id ? ConstTheme.sidebarText.withOpacity(0.08) : Colors.transparent,
        hoverColor: ConstTheme.sidebarText.withOpacity(0.08),
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
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.w, top: 2.w, bottom: 2.w),
                child: UserAvatar(
                  room.directChatMatrixID ?? "-",
                  true,
                  25.w,
                  bg: ConstTheme.sidebarText.withOpacity(0.1),
                  color: ConstTheme.sidebarText,
                ),
              ),
              WidgetUserNameEmoji(
                displayname,
                null,
              ),
            ],
          ),
        ),
      );
    },
  );
}
