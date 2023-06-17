// import 'package:asyou_app/infra/pages/channel/create.dart';
import 'package:asyou_app/infra/pages/user/kyc.dart';
import 'package:flutter/material.dart';

import 'package:asyou_app/infra/pages/channel/create_private.dart';
import 'package:asyou_app/infra/pages/channel/setting/setting.dart';
import 'package:asyou_app/infra/pages/dao/pop/apply_project_funding.dart';
import 'package:asyou_app/infra/pages/dao/pop/create_project.dart';
import 'package:asyou_app/infra/pages/dao/pop/create_roadmap.dart';
import 'package:asyou_app/infra/pages/dao/pop/create_task.dart';
import 'package:asyou_app/infra/pages/dao/pop/join_dao.dart';
import 'package:asyou_app/infra/pages/dao/pop/make_review.dart';
import 'package:asyou_app/infra/pages/dao/pop/referendum_vote.dart';
import 'package:asyou_app/infra/pages/dao/pop/task_info.dart';
import 'package:asyou_app/infra/pages/setting/setting.dart';
import 'package:asyou_app/infra/pages/dao/pop/join_task.dart';
import 'package:asyou_app/infra/pages/channel/create.dart';
import 'package:asyou_app/infra/pages/search.dart';
import 'package:asyou_app/domain/utils/platform_infos.dart';
import 'package:asyou_app/domain/utils/screen/screen.dart';
import 'package:asyou_app/application/store/theme.dart';

getPage(String url, Function closeModel) {
  if (url == "/create_channel") {
    return CreateChannelPage(closeModel: closeModel);
  } else if (url == "/search") {
    return SearchPage(closeModel: closeModel);
  } else if (url == "/setting") {
    return SettingPage(closeModel: closeModel);
  } else if (url == "/create_private") {
    return CreatePrivatePage(closeModel: closeModel);
  } else if (url == "/create_roadmap") {
    return CreateRoadMapPage(closeModel: closeModel);
  } else if (url.indexOf("/create_task/") == 0) {
    final pstr = url.replaceAll("/create_task/", "");
    final ps = pstr.split("/");
    return CreateTaskPage(projectId: ps[0], closeModel: closeModel);
  } else if (url.indexOf("/join_task/") == 0) {
    final pstr = url.replaceAll("/join_task/", "");
    final ps = pstr.split("/");
    return JoinTaskPage(projectId: ps[0], id: ps[1], closeModel: closeModel);
  } else if (url.indexOf("/task_info/") == 0) {
    final pstr = url.replaceAll("/task_info/", "");
    final ps = pstr.split("/");
    return TaskInfoPage(projectId: ps[0], id: ps[1], closeModel: closeModel);
  } else if (url.indexOf("/make_review/") == 0) {
    final pstr = url.replaceAll("/make_review/", "");
    final ps = pstr.split("/");
    return MakeReviewPage(projectId: ps[0], id: ps[1], closeModel: closeModel);
  } else if (url.indexOf("/apply_project_funding/") == 0) {
    final pstr = url.replaceAll("/apply_project_funding/", "");
    return ApplyProjectFundingPage(projectId: pstr, closeModel: closeModel);
  } else if (url.indexOf("/join_dao") == 0) {
    return JoinDaoPage(closeModel: closeModel);
  } else if (url.indexOf("/create_dao_project") == 0) {
    return CreateProjectPage(closeModel: closeModel);
  } else if (url.indexOf("/referendum_vote") == 0) {
    final pstr = url.replaceAll("/referendum_vote/", "");
    final ps = pstr.split("/");
    return ReferendumVotePage(id: ps[0], closeModel: closeModel);
  } else if (url.indexOf("/channel_setting/") == 0) {
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
  }

  return const Center(child: Text("404"));
}

showModelOrPage(context, url, {double width = 520, double height = 550}) {
  final constTheme = Theme.of(context).extension<ExtColors>()!;
  if (isPc() || PlatformInfos.isWeb) {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierColor: constTheme.sidebarHeaderTextColor.withOpacity(0.1),
      builder: (context) {
        final media = MediaQuery.of(context);
        final bottom = media.size.height - 30.w - height.w;
        return Container(
          margin: EdgeInsets.only(
            left: (media.size.width - width.w) / 2,
            right: (media.size.width - width.w) / 2,
            top: 30.w,
            bottom: bottom > 0 ? bottom : 40.w,
          ),
          width: width.w,
          height: height.w,
          // decoration: BoxDecoration(
          //   // color: constTheme.centerChannelBg,
          //   color: Colors.red,
          //   borderRadius: BorderRadius.all(Radius.circular(4.w)),
          //   boxShadow: <BoxShadow>[
          //     BoxShadow(
          //       color: constTheme.centerChannelBg.withOpacity(0.4),
          //       blurRadius: 8.w,
          //     ),
          //   ],
          // ),
          child: getPage(url, () {
            Navigator.pop(context);
          }),
        );
      },
    );
  } else {
    context.pushNamed(url);
  }
}
