import 'package:asyou_app/components/appicon.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import '../../components/dao/text.dart';
import '../../store/theme.dart';

class RoadMapPage extends StatefulWidget {
  const RoadMapPage({super.key});

  @override
  _RoadMapPageState createState() => _RoadMapPageState();
}

class _RoadMapPageState extends State<RoadMapPage> {
  List<String> list1 = [
    "用户客户端 即时通讯功能",
    "用户客户端 移动端",
    "用户客户端 polkadot 登陆",
    "DAO substrate pallet",
    "种子轮融资",
    "TEE Intel SGX libos",
  ];
  List<String> list2 = [
    "DAO DAPP",
    "用户客户端 DAPP render",
    "TEE substrate pallet",
    "wetee 基础服务端",
    "wetee 服务端 docker 深度集成",
    "wetee docker 运行时集成",
    "wetee c/c++ 编译脚本模板",
    "wetee java 编译脚本模板",
    "wetee golang 编译脚本模板",
    "wetee python 编译脚本模板",
    "wetee rust 编译脚本模板",
    "wetee run in docker 模板",
  ];
  List<String> list3 = ["list3_1", "list3_2"];
  List<String> list4 = ["list3_1", "list3_2"];
  final boardScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // padding: EdgeInsets.only(top: 10),
      children: [
        Container(
          margin: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.w),
              PrimaryText(
                text: 'RoadMap',
                size: 25.w,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(height: 8.w),
              PrimaryText(
                text: '工会与项目工会与项目工会与项目工会与项目工会与项目工会与项目工会与项目工会与项目工会与项目工会与项目工会与项目工会与项目工会与项目',
                size: 14.w,
              ),
              SizedBox(height: 15.w),
            ],
          ),
        ),
        Divider(
          height: 20,
          color: constTheme.centerChannelColor.withOpacity(0.1),
        ),
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
                _createListView("2023.Q1", list1),
                _createListView("2023.Q2", list2),
                _createListView("2023.Q3", list3),
                _createListView("2023.Q4", list4),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _createListView(String name, List<String> items) {
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
                width: 65.w,
                decoration: BoxDecoration(
                  color: constTheme.mentionBg,
                  borderRadius: BorderRadius.circular(5.w),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.all(10.w),
                child: Text(
                  name,
                  style: TextStyle(color: constTheme.mentionColor, fontSize: 14.w),
                ),
              ),
              Text(
                items.length.toString(),
                style: TextStyle(color: constTheme.centerChannelColor, fontSize: 12.w),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(10.w),
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
                          Icon(Appicon.a24gfpaperclipCircle,
                              color: constTheme.centerChannelColor.withOpacity(0.5), size: 25.w),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              items[index],
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
                            Container(
                              height: 23.w,
                              width: 65.w,
                              decoration: BoxDecoration(
                                color: constTheme.buttonBg,
                                borderRadius: BorderRadius.circular(5.w),
                              ),
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 5.w),
                              child: Text(
                                "TAG",
                                style: TextStyle(color: constTheme.buttonColor, fontSize: 14.w),
                              ),
                            ),
                          ],
                        ),
                      )
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
