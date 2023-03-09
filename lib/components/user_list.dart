import 'package:flutter/material.dart';

import '../components/name_with_emoji.dart';
import '../components/user_avatar.dart';
import '../utils/screen.dart';
import '../models/user.dart';

Widget usersList(List<User> usersList, User? select, Function(int) onSelect) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: usersList.length,
    itemBuilder: (context, index) {
      var user = usersList[index];
      return InkWell(
        onTap: () {
          onSelect(index);
        },
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 10.w, top: 5.w, bottom: 5.w),
              child: UserAvatar(
                user.address,
                true,
                30.w,
              ),
            ),
            WidgetUserNameEmoji(
              user.name != "" ? user.name : user.address,
              null,
            ),
          ],
        ),
        // child: ListTile(
        //   minVerticalPadding: 1,
        //   leading: userAvatarWidget(
        //     usersList[index].avatarSrc,
        //     usersList[index].online,
        //     30.w,
        //     30.w,
        //   ),
        //   title: Align(
        //     child: WidgetUserNameEmoji(
        //       usersList[index].name,
        //       usersList[index].emojiStatus,
        //     ),
        //     alignment: const Alignment(-1.1, 0),
        //   ),
        // ),
      );
    },
  );
}
