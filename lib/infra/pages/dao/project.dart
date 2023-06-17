import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:asyou_app/infra/router/pop_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:asyou_app/domain/utils/screen/screen.dart';

import 'package:asyou_app/infra/components/components.dart';
import 'package:asyou_app/infra/components/dao/text.dart';
import 'package:asyou_app/router.dart';
import 'package:asyou_app/native_wraper.dart';
import 'package:asyou_app/application/store/dao_ctx.dart';
import 'package:asyou_app/application/store/theme.dart';
import 'package:asyou_app/bridge_struct.dart';
import 'sub/kanban.dart';
import 'sub/member.dart';
import 'sub/referendum.dart';

final GlobalKey projectKey = GlobalKey();

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => ProjectPageState();
}

class ProjectPageState extends State<ProjectPage> with TickerProviderStateMixin {
  final boardScrollController = ScrollController();
  late final DAOCTX dao;
  late TabController _tabController;
  late PageController pageController = PageController();
  final titleList = <String>["Kanban", "Members", "Referendums"];
  ProjectInfo? info;
  List<String> members = [];
  AssetAccountData? share;
  List<GovProps> pending = [];
  List<GovReferendum> going = [];

  List<TaskInfo> todo = [];
  List<TaskInfo> inProgress = [];
  List<TaskInfo> inReview = [];
  List<TaskInfo> done = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: titleList.length, initialIndex: 0);
    dao = context.read<DAOCTX>();
  }

  init(ProjectInfo project) {
    setState(() {
      info = project;
    });
    getData();
  }

  getData() async {
    members = await rustApi.daoProjectMemberList(client: dao.chainClient, daoId: dao.org.daoId, projectId: info!.id);

    final ps = await rustApi.daoProjectTaskList(client: dao.chainClient, projectId: info!.id);
    todo = ps.where((p) => p.status == 0).toList();
    inProgress = ps.where((p) => p.status == 1).toList();
    inReview = ps.where((p) => p.status == 2).toList();
    done = ps.where((p) => p.status == 3).toList();

    share = await rustApi.daoBalance(client: dao.chainClient, daoId: dao.org.daoId, address: info!.daoAccountId);

    pending = dao.pending.where((r) => r.memberGroup.scope == 3 && r.memberGroup.id == info!.id).toList();
    going = dao.going.where((r) => r.memberGroup.scope == 3 && r.memberGroup.id == info!.id).toList();

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Column(
      key: const Key("projectView"),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.w),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    AppIcons.xiangmu,
                    size: 25.w,
                    color: constTheme.centerChannelColor,
                  ),
                  SizedBox(width: 10.w),
                  PrimaryText(
                    text: info != null ? "#${info!.id} ${info!.name}" : "",
                    size: 25.w,
                    height: 1,
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(width: 10.w),
                  Padding(
                    padding: EdgeInsets.only(top: 8.w),
                    child: PrimaryText(
                      text: info != null ? info!.description : "",
                      size: 14.w,
                      height: 1.9,
                    ),
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () async {
                      // showOkCancelAlertDialog(
                      //   context: context,
                      //   title: "Delete project",
                      //   message: "Are you sure you want to delete this project?",
                      //   onOk: () async {
                      //     await rustApi.daoProjectDelete(
                      //       from: dao.user.address,
                      //       client: dao.chainClient,
                      //       daoId: dao.org.daoId,
                      //       projectId: info!.id,
                      //     );
                      //     Navigator.of(context).pop();
                      //     Navigator.of(context).pop();
                      //   },
                      // );
                      if (OkCancelResult.ok ==
                          await showOkCancelAlertDialog(
                            useRootNavigator: false,
                            title: "Notice",
                            message: "Do you confirm to join? Your application will be reviewed by internal members",
                            context: globalCtx(),
                            okLabel: L10n.of(globalCtx())!.next,
                            cancelLabel: L10n.of(globalCtx())!.cancel,
                          )) {
                        if (!await daoCtx.checkAfterTx()) return;
                        await waitFutureLoading(
                          context: globalCtx(),
                          future: () async {
                            await rustApi.daoProjectJoinRequest(
                              from: dao.user.address,
                              client: dao.chainClient,
                              daoId: dao.org.daoId,
                              projectId: info!.id,
                              ext: WithGovPs(
                                runType: 1,
                                amount: 100,
                                member: MemberGroup(
                                  scope: 3,
                                  id: info!.id,
                                ),
                              ),
                            );
                            await daoCtx.daoRefresh();
                            getData();
                          },
                        );
                      }
                    },
                    child: Container(
                      height: 30.w,
                      padding: EdgeInsets.all(5.w),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Icon(
                            Icons.group_add_rounded,
                            size: 20.w,
                            color: constTheme.centerChannelColor,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            "Join",
                            style: TextStyle(
                              fontSize: 14.w,
                              color: constTheme.centerChannelColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    key: const Key("createTaskBtn"),
                    onTap: () {
                      showModelOrPage(context, "/create_task/${info!.id}/-1", width: 800, height: 500);
                    },
                    child: Container(
                      height: 30.w,
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: constTheme.buttonBg,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_circle_outline_rounded,
                            size: 20.w,
                            color: constTheme.buttonColor,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            "Add task",
                            style: TextStyle(
                              fontSize: 14.w,
                              color: constTheme.buttonColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8.w),
              Row(
                children: [
                  PrimaryText(
                    text: "Share: ${share != null ? share!.free : "-"}",
                    size: 14.w,
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      showModelOrPage(context, "/apply_project_funding/${info!.id}", width: 500, height: 300);
                    },
                    child: Container(
                      height: 25.w,
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: constTheme.buttonBg.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Icon(
                            Icons.approval_rounded,
                            size: 15.w,
                            color: constTheme.buttonColor,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            "Apply for project funding",
                            style: TextStyle(
                              fontSize: 10.w,
                              color: constTheme.buttonColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.w),
            ],
          ),
        ),
        TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: constTheme.centerChannelColor,
          unselectedLabelColor: constTheme.centerChannelColor.withOpacity(0.6),
          labelStyle: TextStyle(fontSize: 13.w),
          unselectedLabelStyle: TextStyle(fontSize: 13.w),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          labelPadding: EdgeInsets.only(left: 12.w, right: 12.w),
          tabs: titleList.map((e) => Tab(text: e)).toList(),
          dividerColor: Colors.transparent,
          indicator: MaterialIndicator(
            color: constTheme.sidebarTextActiveBorder,
            strokeWidth: 10,
          ),
          onTap: (i) => pageController.jumpToPage(i),
        ),
        Divider(
          height: 1,
          color: constTheme.centerChannelDivider,
        ),
        SizedBox(height: 10.w),
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            scrollDirection: Axis.vertical,
            onPageChanged: (page) {},
            children: [
              Kanban(todo: todo, inProgress: inProgress, inReview: inReview, done: done),
              Members(members: members),
              Referendums(pending: pending, going: going),
            ],
          ),
        ),
      ],
    );
  }
}

class Item {
  final String title;
  final bool isDraggable;

  Item({required this.title, required this.isDraggable});
}
