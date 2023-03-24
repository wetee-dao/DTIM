import 'package:flutter/material.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';

import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart' as link;
import 'package:provider/provider.dart';

import '../router.dart';
import '../utils/screen.dart';
import '../store/theme.dart';
import '../components/components.dart';
import '../store/im.dart';

class SearchPage extends StatefulWidget {
  final Function? closeModel;
  const SearchPage({Key? key, this.closeModel}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late IMProvider im;
  List<link.PublicRoomsChunk> rooms = [];
  List userList = [];

  @override
  void initState() {
    super.initState();
    im = context.read<IMProvider>();
    getList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getList() async {
    final client = im.currentState!.client;
    var roomResp = await client.getPublicRooms();
    setState(() {
      rooms = roomResp.chunk;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstTheme.centerChannelBg,
      appBar: widget.closeModel == null
          ? LocalAppBar(
              title: "搜索频道",
              onBack: () {
                context.pop();
              },
            ) as PreferredSizeWidget
          : ModelBar(
              title: "搜索频道",
              onBack: () {
                if (widget.closeModel != null) {
                  widget.closeModel!.call();
                  return;
                }
                context.pop();
              },
            ),
      body: Padding(
        padding: EdgeInsets.only(top: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   height: 40.w,
            //   width: MediaQuery.of(context).size.width - 120.w,
            //   margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.w, bottom: 15.w),
            //   padding: EdgeInsets.only(left: 10.w),
            //   decoration: BoxDecoration(
            //     color: ConstTheme.sidebarText.withOpacity(0.1),
            //     borderRadius: BorderRadius.all(Radius.circular(3.w)),
            //   ),
            //   alignment: Alignment.center,
            //   child: TextField(
            //     onTap: () {},
            //     style: TextStyle(color: ConstTheme.sidebarText.withAlpha(155), fontSize: 13.w),
            //     autofocus: true,
            //     keyboardType: TextInputType.text,
            //     decoration: InputDecoration(
            //       hintText: '查找频道',
            //       hintStyle: TextStyle(
            //         height: 1.5,
            //         color: ConstTheme.sidebarText.withAlpha(155),
            //       ),
            //       suffixIcon: Icon(Icons.search, size: 20.w, color: ConstTheme.sidebarText.withAlpha(155)),
            //       contentPadding: const EdgeInsets.all(0),
            //       border: const OutlineInputBorder(borderSide: BorderSide.none),
            //       label: null,
            //     ),
            //   ),
            // ),
            SizedBox(height: 10.w),
            Expanded(
              child: ListView.builder(
                itemCount: rooms.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var room = rooms[index];
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: EdgeInsets.only(bottom: 10.w, left: 15.w, right: 15.w),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30.w,
                          height: 30.w,
                          child: Center(
                            child: Icon(
                              Icons.all_inclusive_sharp,
                              size: 25.w,
                              color: ConstTheme.centerChannelColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            room.name ?? "",
                            style: TextStyle(
                              color: ConstTheme.centerChannelColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.w,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        IconButton(
                          key: Key("${room.roomId}_join"),
                          onPressed: () async {
                            final client = im.currentState!.client;
                            await showFutureLoadingDialog(
                              context: globalCtx(),
                              future: () async {
                                await client.joinRoomById(rooms[index].roomId);
                                // ignore: use_build_context_synchronously
                                globalCtx().pop();
                              },
                            );
                          },
                          icon: const Icon(Icons.control_point_duplicate_rounded),
                          color: ConstTheme.centerChannelColor,
                        )
                      ],
                    ),
                  );
                },
              ),
            )

            // Container(
            //   padding: EdgeInsets.only(left: 15.w),
            //   height: 110.w,
            //   child: ListView.builder(
            //       itemCount: userList.length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.vertical,
            //       itemBuilder: (context, index) {
            //         return Row(
            //           children: [
            //             Column(
            //               children: [
            //                 UserAvatar(
            //                   userList[index].avatarSrc,
            //                   userList[index].online,
            //                   60.w,
            //                 ),
            //                 SizedBox(height: 5.w),
            //                 SizedBox(
            //                   width: 50.w,
            //                   child: Text(
            //                     userList[index].name,
            //                     maxLines: 2,
            //                     overflow: TextOverflow.ellipsis,
            //                     softWrap: false,
            //                     style: TextStyle(
            //                       color: ConstTheme.centerChannelColor,
            //                       fontWeight: FontWeight.w600,
            //                     ),
            //                     textAlign: TextAlign.center,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             SizedBox(
            //               width: 10.w,
            //             ),
            //           ],
            //         );
            //       }),
            // ),
            // SizedBox(height: 10.w),
            // Divider(
            //   height: 5.w,
            //   color: ConstTheme.centerChannelColor.withOpacity(0.1),
            // ),
          ],
        ),
      ),
    );
  }
}
