import 'package:asyou_app/bridge_generated.dart';
import 'package:asyou_app/components/avatar.dart';
import 'package:asyou_app/components/loading.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/appicon.dart';
import '../../components/dao/priority_icon.dart';
import '../../components/dao/text.dart';
import '../../models/tag.dart';
import '../../router.dart';
import '../../rust_wraper.io.dart';
import '../../store/dao_ctx.dart';
import '../../store/theme.dart';

final GlobalKey projectKey = GlobalKey();

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => ProjectPageState();
}

class ProjectPageState extends State<ProjectPage> {
  final boardScrollController = ScrollController();
  late final DAOCTX dao;
  ProjectInfo? info;
  List<String> members = [];
  AssetAccountData? share;

  @override
  void initState() {
    super.initState();
    dao = context.read<DAOCTX>();
  }

  getData(ProjectInfo project) async {
    info = project;
    members = await rustApi.daoProjectMemberList(client: dao.chainClient, daoId: dao.org.daoId, projectId: project.id);
    print(members);
    var ps = await rustApi.daoProjectTaskList(client: dao.chainClient, daoId: dao.org.daoId, projectId: project.id);
    todo = ps.where((p) => p.status == 0).toList();
    inProgress = ps.where((p) => p.status == 1).toList();
    inReview = ps.where((p) => p.status == 2).toList();
    done = ps.where((p) => p.status == 3).toList();
    share = await rustApi.daoBalance(client: dao.chainClient, daoId: dao.org.daoId, address: project.daoAccountId);
    if (mounted) setState(() {});
  }

  List<TaskInfo> todo = [];
  List<TaskInfo> inProgress = [];
  List<TaskInfo> inReview = [];
  List<TaskInfo> done = [];

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.w),
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
              SizedBox(height: 15.w),
            ],
          ),
        ),
        Divider(
          height: 20.w,
          color: constTheme.centerChannelColor.withOpacity(0.1),
        ),
        SizedBox(height: 10.w),
        Expanded(
          child: Scrollbar(
            radius: const Radius.circular(9),
            thumbVisibility: true,
            controller: boardScrollController,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              controller: boardScrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(width: 20.w),
                _createListView("To Do", 0, Appicon.samlogoFCM, constTheme.centerChannelColor.withOpacity(0.5), todo),
                _createListView("In Progress", 1, Appicon.iconjinxingzhong, Colors.yellow.withOpacity(0.5), inProgress),
                _createListView("In Review", 2, Appicon.view, Colors.blueGrey.withOpacity(0.5), inReview),
                _createListView("Done", 3, Appicon.done, Colors.green.withOpacity(0.5), done),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _createListView(String name, int status, IconData icon, Color color, List<TaskInfo> items) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Container(
      decoration: BoxDecoration(
        color: constTheme.centerChannelColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(5.w),
        boxShadow: <BoxShadow>[
          BoxShadow(color: constTheme.sidebarBg.withOpacity(0.2), blurRadius: 10.w),
        ],
      ),
      width: 250.w,
      margin: EdgeInsets.only(right: 10.w, bottom: 15.w),
      height: double.maxFinite,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 10.w),
              Icon(icon, color: color, size: 18.w),
              Container(
                height: 23.w,
                alignment: Alignment.center,
                margin: EdgeInsets.all(10.w),
                child: Text(
                  name,
                  style: TextStyle(color: constTheme.centerChannelColor, fontSize: 14.w),
                ),
              ),
              Text(
                items.length.toString(),
                style: TextStyle(color: constTheme.centerChannelColor, fontSize: 12.w),
              ),
            ],
          ),
          // if (items.isNotEmpty)
          Expanded(
            child: DragTarget<TaskInfo>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return ListView.builder(
                  itemCount: items.isNotEmpty ? items.length : 1,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10.w),
                  itemBuilder: (context, index) {
                    if (items.isEmpty) {
                      return Container(
                        alignment: Alignment.center,
                        height: 180.w,
                        child: Text(
                          "暂无任务",
                          style: TextStyle(
                            color: constTheme.centerChannelColor.withOpacity(0.5),
                            fontSize: 14.w,
                          ),
                        ),
                      );
                    }
                    // 在拖动到DragTarget后删除数据
                    return Draggable<TaskInfo>(
                      onDragCompleted: () {
                        // setState(() {
                        //   items.removeAt(index);
                        // });
                      },
                      onDraggableCanceled: (v, o) {
                        // setState(() {
                        //   items.removeAt(index);
                        // });
                      },
                      // 移动中的组件
                      feedback: SizedBox(
                        width: 230.w,
                        child: Material(color: Colors.transparent, child: item(items[index])),
                      ),
                      data: items[index],
                      child: item(items[index]),
                    );
                  },
                );
              },
              onAccept: (TaskInfo data) {
                if (data.status == status) {
                  return;
                }
                if (status == 1 && data.status == 0) {
                  startTask(data);
                  return;
                }
                if (status == 2 && data.status == 1) {
                  requestReview(data);
                  return;
                }
                if (status == 3 && data.status == 2) {
                  taskDone(data);
                  return;
                }
                BotToast.showText(text: "无效的操作", duration: const Duration(seconds: 2));
              },
            ),
          ),
          // if (items.isEmpty)
          // ),
        ],
      ),
    );
  }

  item(TaskInfo data) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Container(
      width: double.maxFinite,
      // padding: EdgeInsets.only(top: 10.w),
      decoration: BoxDecoration(
        color: constTheme.centerChannelColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(5.w),
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 5.w),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showModelOrPage(
                context,
                "/task_info/${info!.id.toString()}/${data.id.toString()}",
                width: 800,
                height: 500,
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.w),
                Row(
                  children: [
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        "#${data.id} ${data.name}",
                        style: TextStyle(
                          color: constTheme.centerChannelColor,
                          fontSize: 14.w,
                          decoration: TextDecoration.none,
                        ),
                        textAlign: TextAlign.left,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.w),
                  child: Wrap(
                    runSpacing: 5.w,
                    spacing: 5.w,
                    alignment: WrapAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: constTheme.centerChannelColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 8.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PriorityIcon(size: 2.w, priority: data.priority),
                            SizedBox(width: 5.w),
                            Text(
                              prioritys[data.priority] ?? "",
                              style: TextStyle(color: constTheme.centerChannelColor, fontSize: 10.w),
                            ),
                          ],
                        ),
                      ),
                      for (var tag in data.skills)
                        Container(
                          decoration: BoxDecoration(
                            color: constTheme.centerChannelColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 8.w),
                          child: Text(
                            findTag(tag).label,
                            style: TextStyle(color: constTheme.centerChannelColor, fontSize: 10.w),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1.w, color: constTheme.centerChannelBg.withOpacity(0.4)),
          Container(
            width: double.maxFinite,
            height: 35.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.w), bottomRight: Radius.circular(5.w)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 8.w),
                // for (var i = 0; i < data.assignees.length; i++) UserAvatar(data.assignees[i], 25.w),
                Expanded(child: Container()),
                if (data.status == 0)
                  InkWell(
                    onTap: () {
                      showModelOrPage(
                        context,
                        "/join_task/${info!.id.toString()}/${data.id.toString()}",
                        width: 510,
                        height: 250,
                      );
                    },
                    child: Container(
                      height: 20.w,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      margin: EdgeInsets.only(top: 2.w, bottom: 2.w),
                      child: Text(
                        "Join",
                        style: TextStyle(
                          color: constTheme.centerChannelColor,
                          fontSize: 13.w,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                if (data.status == 0) SizedBox(width: 5.w),
                if (data.status == 0)
                  InkWell(
                    onTap: () {
                      startTask(data);
                    },
                    child: Container(
                      height: 20.w,
                      decoration: BoxDecoration(
                        color: constTheme.buttonBg.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      margin: EdgeInsets.only(top: 2.w, bottom: 2.w),
                      child: Text(
                        "Start",
                        style: TextStyle(
                          color: constTheme.buttonColor,
                          fontSize: 13.w,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                if (data.status == 0) SizedBox(width: 5.w),
                if (data.status == 1)
                  InkWell(
                    onTap: () {
                      requestReview(data);
                    },
                    child: Container(
                      height: 20.w,
                      decoration: BoxDecoration(
                        color: constTheme.buttonBg.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      margin: EdgeInsets.only(top: 2.w, bottom: 2.w),
                      child: Text(
                        "Request review",
                        style: TextStyle(
                          color: constTheme.buttonColor,
                          fontSize: 13.w,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                if (data.status == 1) SizedBox(width: 5.w),
                if (data.status == 2)
                  InkWell(
                    onTap: () {
                      makeReviwe(data);
                    },
                    child: Container(
                      height: 20.w,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      margin: EdgeInsets.only(top: 2.w, bottom: 2.w),
                      child: Text(
                        "Make review",
                        style: TextStyle(
                          color: constTheme.centerChannelColor,
                          fontSize: 13.w,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                if (data.status == 2) SizedBox(width: 5.w),
                if (data.status == 2)
                  InkWell(
                    onTap: () {
                      taskDone(data);
                    },
                    child: Container(
                      height: 20.w,
                      decoration: BoxDecoration(
                        color: constTheme.buttonBg.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      margin: EdgeInsets.only(top: 2.w, bottom: 2.w),
                      child: Text(
                        "Complete task",
                        style: TextStyle(
                          color: constTheme.buttonColor,
                          fontSize: 13.w,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                if (data.status == 2) SizedBox(width: 5.w),
                SizedBox(width: 5.w)
              ],
            ),
          )
        ],
      ),
    );
  }

  startTask(TaskInfo data) async {
    if (data.assignees.isEmpty) {
      BotToast.showText(text: "开发者不能为空", duration: const Duration(seconds: 2));
      return;
    }
    if (data.reviewers.isEmpty) {
      BotToast.showText(text: "验证者不能为空", duration: const Duration(seconds: 2));
      return;
    }
    await waitFutureLoading(
      context: context,
      future: () async {
        await rustApi.daoProjectStartTask(
          from: dao.user.address,
          client: dao.chainClient,
          daoId: dao.org.daoId,
          projectId: info!.id,
          taskId: data.id,
        );
      },
    );
  }

  requestReview(TaskInfo data) async {
    print(data.id);
    await waitFutureLoading(
      context: context,
      future: () async {
        await rustApi.daoProjectRequestReview(
          from: dao.user.address,
          client: dao.chainClient,
          daoId: dao.org.daoId,
          projectId: info!.id,
          taskId: data.id,
        );
      },
    );
  }

  taskDone(TaskInfo data) async {
    await waitFutureLoading(
      context: context,
      future: () async {
        await rustApi.daoProjectTaskDone(
          from: dao.user.address,
          client: dao.chainClient,
          daoId: dao.org.daoId,
          projectId: info!.id,
          taskId: data.id,
        );
      },
    );
  }

  makeReviwe(TaskInfo data) async {
    if (!data.reviewers.contains(dao.user.address)) {
      BotToast.showText(text: "You are not the reviewer of the task", duration: const Duration(seconds: 2));
      return;
    }
    showModelOrPage(
      context,
      "/make_review/${info!.id.toString()}/${data.id.toString()}",
      width: 510,
      height: 350,
    );
  }
}

class Item {
  final String title;
  final bool isDraggable;

  Item({required this.title, required this.isDraggable});
}
