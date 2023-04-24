import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:asyou_app/bridge_generated.dart';
import 'package:asyou_app/utils/screen.dart';

import '../../components/dao/text.dart';
import '../../router.dart';
import '../../rust_wraper.io.dart';
import '../../store/dao_ctx.dart';
import '../../store/theme.dart';
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

  getData(ProjectInfo project) async {
    info = project;
    members = await rustApi.daoProjectMemberList(client: dao.chainClient, daoId: dao.org.daoId, projectId: project.id);

    final ps = await rustApi.daoProjectTaskList(client: dao.chainClient, daoId: dao.org.daoId, projectId: project.id);
    todo = ps.where((p) => p.status == 0).toList();
    inProgress = ps.where((p) => p.status == 1).toList();
    inReview = ps.where((p) => p.status == 2).toList();
    done = ps.where((p) => p.status == 3).toList();

    share = await rustApi.daoBalance(client: dao.chainClient, daoId: dao.org.daoId, address: project.daoAccountId);

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.w),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.library_add_rounded,
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
                  SizedBox(width: 20.w),
                  PrimaryText(
                    text: info != null ? info!.description : "",
                    size: 14.w,
                    height: 1.9,
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {
                      // showModelOrPage(context, "/create_roadmap");
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
                            "加入项目",
                            style: TextStyle(
                              fontSize: 14.w,
                              color: constTheme.buttonColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
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
                            "添加任务",
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
              PrimaryText(
                text: "Share: ${share != null ? share!.free : "-"}",
                size: 14.w,
              ),
              SizedBox(height: 5.w),
            ],
          ),
        ),
        TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: constTheme.sidebarHeaderTextColor,
          unselectedLabelColor: constTheme.sidebarHeaderTextColor.withOpacity(0.6),
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
