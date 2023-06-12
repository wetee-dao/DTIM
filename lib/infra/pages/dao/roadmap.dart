import 'package:asyou_app/infra/router/pop_router.dart';
import 'package:asyou_app/router.dart';
import 'package:asyou_app/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:asyou_app/bridge_struct.dart';
import 'package:asyou_app/infra/components/components.dart';
import 'package:asyou_app/infra/components/dao/priority_icon.dart';
import 'package:asyou_app/infra/components/dao/text.dart';
import 'package:asyou_app/domain/models/tag.dart';
import 'package:asyou_app/native_wraper.io.dart';
import 'package:asyou_app/application/store/dao_ctx.dart';
import 'package:asyou_app/application/store/im.dart';
import 'package:asyou_app/application/store/theme.dart';

class RoadMapPage extends StatefulWidget {
  const RoadMapPage({super.key});

  @override
  State<RoadMapPage> createState() => _RoadMapPageState();
}

class _RoadMapPageState extends State<RoadMapPage> {
  late final AppCubit im;
  late final DAOCTX dao;
  bool _loading = true;
  List<Quarter> quarters = [];

  @override
  void initState() {
    super.initState();
    im = context.read<AppCubit>();
    dao = context.read<DAOCTX>();
    getData();
    dao.addListener(getData);
  }

  @override
  void dispose() {
    dao.removeListener(getData);
    super.dispose();
  }

  getData() async {
    quarters = await rustApi.daoRoadmap(
      client: dao.chainClient,
      daoId: im.currentState!.org.daoId,
      year: 2023,
    );
    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  final boardScrollController = ScrollController();

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
              SizedBox(height: 20.w),
              Row(
                children: [
                  Icon(
                    Icons.integration_instructions_rounded,
                    size: 30.w,
                    color: constTheme.centerChannelColor,
                  ),
                  SizedBox(width: 10.w),
                  PrimaryText(
                    text: 'RoadMap',
                    size: 25.w,
                    fontWeight: FontWeight.w800,
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () async {
                      showModelOrPage(context, "/create_roadmap");
                    },
                    child: Container(
                      height: 30.w,
                      padding: EdgeInsets.all(5.w),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_circle_rounded,
                            size: 20.w,
                            color: constTheme.centerChannelColor,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            "Add task",
                            style: TextStyle(
                              fontSize: 14.w,
                              color: constTheme.centerChannelColor,
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
                text: daoCtx.dao.purpose,
                size: 14.w,
              ),
              SizedBox(height: 10.w),
            ],
          ),
        ),
        Divider(
          height: 20.w,
          color: constTheme.centerChannelDivider,
        ),
        Expanded(
          child: !_loading
              ? Scrollbar(
                  radius: const Radius.circular(9),
                  thumbVisibility: true,
                  controller: boardScrollController,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    controller: boardScrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      SizedBox(width: 10.w),
                      for (var quarter in quarters)
                        _createListView(
                          "${quarter.year}.Q${quarter.quarter}",
                          quarter.tasks,
                        ),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator.adaptive(strokeWidth: 4.w)),
        ),
      ],
    );
  }

  Widget _createListView(String name, List<QuarterTask> items) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return SizedBox(
      width: 250.w,
      height: double.maxFinite,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 23.w,
                width: 68.w,
                decoration: BoxDecoration(
                  color: constTheme.mentionBg,
                  borderRadius: BorderRadius.circular(5.w),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.all(10.w),
                child: Text(
                  name,
                  style: TextStyle(
                    color: constTheme.centerChannelBg,
                    fontSize: 14.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  items.length.toString(),
                  style: TextStyle(color: constTheme.centerChannelColor, fontSize: 12.w),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.w),
              itemBuilder: (context, index) {
                return Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w, bottom: 13.w),
                  decoration: BoxDecoration(
                    color: constTheme.centerChannelColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 3.w),
                            child: Icon(AppIcons.ziyuan, color: constTheme.centerChannelColor, size: 16.w),
                          ),
                          SizedBox(width: 7.w),
                          Expanded(
                            child: Text(
                              items[index].name,
                              style: TextStyle(
                                color: constTheme.centerChannelColor,
                                fontSize: 14.w,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.w),
                      Wrap(
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
                                PriorityIcon(size: 2.w, priority: items[index].priority),
                                SizedBox(width: 5.w),
                                Text(
                                  prioritys[items[index].priority] ?? "",
                                  style: TextStyle(color: constTheme.centerChannelColor, fontSize: 10.w),
                                ),
                              ],
                            ),
                          ),
                          for (var tag in items[index].tags)
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
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String title;
  final bool isDraggable;

  Item({required this.title, required this.isDraggable});
}
