import 'package:dtim/infra/router/pop_router.dart';
import 'package:dtim/application/store/work_ctx.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';


import 'package:dtim/infra/components/components.dart';
import 'package:dtim/infra/components/dao/priority_icon.dart';
import 'package:dtim/domain/models/tag.dart';
import 'package:dtim/router.dart';

import 'package:dtim/application/store/theme.dart';

class Kanban extends StatelessWidget {
  final List<TaskInfo> todo;
  final List<TaskInfo> inProgress;
  final List<TaskInfo> inReview;
  final List<TaskInfo> done;
  const Kanban({Key? key, required this.todo, required this.inProgress, required this.inReview, required this.done})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final boardScrollController = ScrollController();
    return Scrollbar(
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
          _createListView("To Do", 0, AppIcons.a_samlogo_fcm, constTheme.centerChannelColor.withOpacity(0.5), todo),
          _createListView("In Progress", 1, AppIcons.icon_jinhangzhong, Colors.yellow.withOpacity(0.5), inProgress),
          _createListView("In Review", 2, AppIcons.view, Colors.blueGrey.withOpacity(0.5), inReview),
          _createListView("Done", 3, AppIcons.done, Colors.green.withOpacity(0.5), done),
        ],
      ),
    );
  }

  Widget _createListView(String name, int status, IconData icon, Color color, List<TaskInfo> items) {
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    return Container(
      decoration: BoxDecoration(
        color: constTheme.centerChannelColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(5.w),
        // boxShadow: <BoxShadow>[
        //   BoxShadow(color: constTheme.sidebarBg.withOpacity(0.2), blurRadius: 10.w),
        // ],
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
    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
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
                globalCtx(),
                "/task_info/${data.projectId.toString()}/${data.id.toString()}",
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
                            findTag(tag.value).label,
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
                // for (var i = 0; i < data.assignees.length; i++) BaseAvatar(data.assignees[i], 25.w),
                Expanded(child: Container()),
                if (data.status == 0)
                  InkWell(
                    onTap: () {
                      showModelOrPage(
                        globalCtx(),
                        "/join_task/${data.projectId.toString()}/${data.id.toString()}",
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
    if (!await workCtx.checkAfterTx()) return;
    await waitFutureLoading(
      context: globalCtx(),
      future: () async {
        await rustApi.daoProjectStartTask(
          from: workCtx.user.address,
          client: workCtx.chainClient,
          daoId: workCtx.org.daoId,
          projectId: data.projectId,
          taskId: data.id,
        );
      },
    );
  }

  requestReview(TaskInfo data) async {
    print(data.id);
    if (!await workCtx.checkAfterTx()) return;
    await waitFutureLoading(
      context: globalCtx(),
      future: () async {
        await rustApi.daoProjectRequestReview(
          from: workCtx.user.address,
          client: workCtx.chainClient,
          daoId: workCtx.org.daoId,
          projectId: data.projectId,
          taskId: data.id,
        );
      },
    );
  }

  taskDone(TaskInfo data) async {
    if (!await workCtx.checkAfterTx()) return;
    await waitFutureLoading(
      context: globalCtx(),
      future: () async {
        await rustApi.daoProjectTaskDone(
          from: workCtx.user.address,
          client: workCtx.chainClient,
          daoId: workCtx.org.daoId,
          projectId: data.projectId,
          taskId: data.id,
        );
      },
    );
  }

  makeReviwe(TaskInfo data) async {
    if (!data.reviewers.contains(workCtx.user.address)) {
      BotToast.showText(text: "You are not the reviewer of the task", duration: const Duration(seconds: 2));
      return;
    }
    showModelOrPage(
      globalCtx(),
      "/make_review/${data.projectId.toString()}/${data.id.toString()}",
      width: 510,
      height: 350,
    );
  }
}
