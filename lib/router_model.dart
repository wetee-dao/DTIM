import 'package:flutter/material.dart';

import 'pages/channel/create.dart';
import 'pages/channel/create_private.dart';
import 'pages/channel/members.dart';
import 'pages/search.dart';
import 'pages/setting/setting.dart';
import 'store/theme.dart';
import 'utils/screen.dart';

showModelOrPage(context, url, {double width = 600, double height = 600, Map<String, String>? ps}) {
  if (isPc()) {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierColor: ConstTheme.sidebarHeaderTextColor.withOpacity(0.06),
      builder: (context) {
        var media = MediaQuery.of(context);
        var bottom = media.size.height - 30.w - height.w;
        return Container(
          margin: EdgeInsets.only(
            left: (media.size.width - width.w) / 2,
            right: (media.size.width - width.w) / 2,
            top: 30.w,
            bottom: bottom > 0 ? bottom : 40.w,
          ),
          width: width.w,
          height: height.w,
          decoration: BoxDecoration(
            color: ConstTheme.centerChannelBg,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8.w,
              ),
            ],
          ),
          child: getPage(url, ps, () {
            Navigator.pop(context);
          }),
        );
      },
    );
  } else {
    context.push(url);
  }
}

getPage(String url, Map<String, String>? ps, Function closeModel) {
  if (url == "/create_channel") {
    return CreateChannelPage(closeModel: closeModel);
  } else if (url == "/search") {
    return SearchPage(closeModel: closeModel);
  } else if (url == "/setting") {
    return SettingPage(closeModel: closeModel);
  } else if (url == "/create_private") {
    return CreatePrivatePage(closeModel: closeModel);
  } else if (url.indexOf("/channel_members/") == 0) {
    return ChannelMemberPage(
      closeModel: closeModel,
      id: ps == null ? "" : (ps["id"] ?? ""),
    );
  }

  return const Center(child: Text("404"));
}
