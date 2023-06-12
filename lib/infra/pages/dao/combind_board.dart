import 'package:asyou_app/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:asyou_app/infra/components/components.dart';
import 'package:asyou_app/infra/components/dao/text.dart';
import 'package:asyou_app/application/store/theme.dart';

class CombindBoardPage extends StatefulWidget {
  const CombindBoardPage({super.key});

  @override
  State<CombindBoardPage> createState() => _CombindBoardPageState();
}

class _CombindBoardPageState extends State<CombindBoardPage> {
  final boardScrollController = ScrollController();
  List<String> list1 = ["list1_1", "list1_2", "list1_3"];
  List<String> list2 = ["list2_1", "list2_2"];
  List<String> list3 = ["list3_1", "list3_2"];
  List<String> list4 = ["list3_1", "list3_2"];

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // padding: EdgeInsets.only(top: 10),
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
                    Icons.library_add_rounded,
                    size: 25.w,
                    color: constTheme.centerChannelColor,
                  ),
                  SizedBox(width: 10.w),
                  PrimaryText(
                    text: 'Combind Boards',
                    size: 25.w,
                    fontWeight: FontWeight.w800,
                  ),
                ],
              ),
              SizedBox(height: 8.w),
              PrimaryText(
                text: '工会与项目',
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
          // child: Container(
          //   color: Colors.blue,
          //   height: double.maxFinite,
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.vertical,
          //     child: Row(
          //       children: [
          //         _createListView("2023.Q1", list1),
          //         _createListView("2023.Q2", list2),
          //         _createListView("2023.Q3", list3),
          //         _createListView("2023.Q4", list4),
          //       ],
          //     ),
          //   ),
          // ),
          // child: Container(
          //   color: Colors.red,
          // ),
          child: Scrollbar(
            radius: const Radius.circular(9),
            // thickness: 4,
            thumbVisibility: true,
            controller: boardScrollController,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              controller: boardScrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(width: 20.w),
                _createListView("To Do", AppIcons.a_samlogo_fcm, constTheme.centerChannelColor.withOpacity(0.5), list1),
                _createListView("In Progress", AppIcons.icon_jinhangzhong, Colors.yellow.withOpacity(0.5), list2),
                _createListView("In Review", AppIcons.view, Colors.blueGrey.withOpacity(0.5), list3),
                _createListView("Done", AppIcons.done, Colors.green.withOpacity(0.5), list4),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _createListView(String name, IconData icon, Color color, List<String> items) {
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
          Expanded(
            child: DragTarget<String>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return ListView.builder(
                  itemCount: items.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return Draggable<String>(
                      onDragCompleted: () {
                        // 在拖动到DragTarget后删除数据
                        setState(() {
                          items.removeAt(index);
                        });
                      },
                      feedback: Material(
                        color: constTheme.centerChannelColor.withOpacity(0.05),
                        child: item(items[index]),
                      ),
                      data: items[index],
                      child: item(items[index]),
                    );
                  },
                );
              },
              onAccept: (String data) {
                setState(() {
                  // 添加Draggable数据到list
                  items.add(data);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  item(data) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(top: 10.w),
      decoration: BoxDecoration(
        color: constTheme.centerChannelColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(5.w),
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 5.w),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  data,
                  style: TextStyle(color: constTheme.centerChannelColor, fontSize: 14.w),
                  textAlign: TextAlign.left,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.w,
            child: Row(
              children: [
                SizedBox(width: 10.w),
                Container(
                  height: 18.w,
                  width: 45.w,
                  decoration: BoxDecoration(
                    color: constTheme.buttonBg.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 5.w, bottom: 5.w),
                  child: Text(
                    "TAG",
                    style: TextStyle(color: constTheme.buttonColor, fontSize: 13.w),
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
                Container(
                  height: 20.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  margin: EdgeInsets.only(top: 5.w, bottom: 5.w, right: 10.w),
                  child: Text(
                    "Join",
                    style: TextStyle(color: constTheme.centerChannelColor, fontSize: 13.w),
                  ),
                ),
              ],
            ),
          )
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
