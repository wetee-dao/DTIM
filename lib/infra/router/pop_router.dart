// import 'package:dtim/infra/pages/channel/create.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dtim/infra/pages/user/kyc.dart';
import 'package:dtim/infra/pages/user/setting.dart';
import 'package:flutter/material.dart';

import 'package:dtim/infra/pages/channel/create_private.dart';
import 'package:dtim/infra/pages/channel/setting/setting.dart';
import 'package:dtim/infra/pages/setting/setting.dart';
import 'package:dtim/infra/pages/channel/create.dart';
import 'package:dtim/infra/pages/search.dart';
import 'package:dtim/domain/utils/platform_infos.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/application/store/theme.dart';

getPage(String url, Function closeModel) {
  if (url == "/create_channel") {
    return CreateChannelPage(closeModel: closeModel);
  } else if (url == "/search") {
    return SearchPage(closeModel: closeModel);
  } else if (url == "/setting") {
    return SettingPage(closeModel: closeModel);
  } else if (url == "/create_private") {
    return CreatePrivatePage(closeModel: closeModel);
  }
  // else if (url == "/create_roadmap") {
  //   return CreateRoadMapPage(closeModel: closeModel);
  // } else if (url.indexOf("/create_task/") == 0) {
  //   final pstr = url.replaceAll("/create_task/", "");
  //   final ps = pstr.split("/");
  //   return CreateTaskPage(projectId: ps[0], closeModel: closeModel);
  // } else if (url.indexOf("/join_task/") == 0) {
  //   final pstr = url.replaceAll("/join_task/", "");
  //   final ps = pstr.split("/");
  //   return JoinTaskPage(projectId: ps[0], id: ps[1], closeModel: closeModel);
  // } else if (url.indexOf("/task_info/") == 0) {
  //   final pstr = url.replaceAll("/task_info/", "");
  //   final ps = pstr.split("/");
  //   return TaskInfoPage(projectId: ps[0], id: ps[1], closeModel: closeModel);
  // } else if (url.indexOf("/make_review/") == 0) {
  //   final pstr = url.replaceAll("/make_review/", "");
  //   final ps = pstr.split("/");
  //   return MakeReviewPage(projectId: ps[0], id: ps[1], closeModel: closeModel);
  // } else if (url.indexOf("/apply_project_funding/") == 0) {
  //   final pstr = url.replaceAll("/apply_project_funding/", "");
  //   return ApplyProjectFundingPage(projectId: pstr, closeModel: closeModel);
  // } else if (url.indexOf("/join_dao") == 0) {
  //   return JoinWorkPage(closeModel: closeModel);
  // } else if (url.indexOf("/create_dao_project") == 0) {
  //   return CreateProjectPage(closeModel: closeModel);
  // } else if (url.indexOf("/referendum_vote") == 0) {
  //   final pstr = url.replaceAll("/referendum_vote/", "");
  //   final ps = pstr.split("/");
  //   return ReferendumVotePage(id: ps[0], closeModel: closeModel);
  // } else if (url.indexOf("/create_treasury") == 0) {
  //   return CreateTreasuryPage(closeModel: closeModel);
  // }
  else if (url.indexOf("/channel_setting/") == 0) {
    final pstr = url.replaceAll("/channel_setting/", "");
    final ps = pstr.split("/");
    return ChannelSettingPage(
      closeModel: closeModel,
      id: Uri.decodeComponent(ps[0]),
      t: Uri.decodeComponent(ps[1]),
    );
  } else if (url.indexOf("/invitation/") == 0) {
    // final pstr = url.replaceAll("/invitation/", "");
    // final ps = pstr.split("/");
  } else if (url.indexOf("/kyc") == 0) {
    return KycPage(closeModel: closeModel);
  } else if (url.indexOf("/user_setting") == 0) {
    return UserSettingPage(closeModel: closeModel);
  }

  return const Center(child: Text("404"));
}

Future<T?> showModelOrPage<T>(context, url, {double width = 520, double height = 550, double top = 30}) async {
  final constTheme = Theme.of(context).extension<ExtColors>()!;
  if (isPc() || PlatformInfos.isWeb) {
    return showDialog<T>(
      context: context,
      useSafeArea: true,
      barrierColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white.withOpacity(0.1)
          : Colors.black.withOpacity(0.7),
      builder: (context) {
        final media = MediaQuery.of(context);
        final bottom = media.size.height - 30.w - height.w;
        return Container(
          margin: EdgeInsets.only(
            left: (media.size.width - width.w) / 2,
            right: (media.size.width - width.w) / 2,
            top: top.w,
            bottom: bottom > 0 ? bottom : 40.w,
          ),
          width: width.w,
          height: height.w,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).brightness == Brightness.dark
                    ? constTheme.centerChannelBg.withOpacity(0.4)
                    : Colors.black.withOpacity(0.2),
                blurRadius: 8.w,
              ),
            ],
          ),
          child: ClipRRect(
            // clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(
              7.w,
            ),
            child: getPage(url, () {
              context.router.pop();
            }),
          ),
        );
      },
    );
  } else {
    return context.router.pushNamed(url);
  }
}
