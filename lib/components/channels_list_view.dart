import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart' as link;

import '../store/theme.dart';
import '../utils/screen.dart';
import 'hover_list_item.dart';

class ChannelsListView extends StatefulWidget {
  final List<link.Room> channelsList;
  final String currentId;
  final Function onSelect;

  const ChannelsListView(this.channelsList, this.currentId, this.onSelect, {Key? key}) : super(key: key);

  @override
  State<ChannelsListView> createState() => _ChannelsListViewState();
}

class _ChannelsListViewState extends State<ChannelsListView> {
  // 当前激活
  int hover = -1;

  @override
  Widget build(BuildContext context) {
    final channelsList = widget.channelsList;
    final currentId = widget.currentId;
    final onSelect = widget.onSelect;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: channelsList.length,
      itemBuilder: (context, index) {
        return HoverListItem(
          key: Key("channels_list_$index"),
          ishover: index == hover,
          color: currentId == channelsList[index].id ? ConstTheme.sidebarText.withOpacity(0.08) : Colors.transparent,
          hoverColor: ConstTheme.sidebarText.withOpacity(0.08),
          onPressed: () async {
            onSelect(channelsList[index].id);
          },
          trailing: GestureDetector(
            onTapDown: (e) async {
              setState(() {
                hover = index;
              });
              final offset = e.globalPosition;
              final result = await showMenu(
                context: context,
                color: ConstTheme.sidebarBg,
                shape: Border.all(color: ConstTheme.sidebarText.withOpacity(0.08)),
                position: RelativeRect.fromLTRB(
                  offset.dx,
                  offset.dy,
                  MediaQuery.of(context).size.width - offset.dx,
                  MediaQuery.of(context).size.height - offset.dy,
                ),
                constraints: const BoxConstraints(minHeight: 0),
                items: <PopupMenuItem<String>>[
                  renderItem("f", Icons.star_border, "收藏"),
                  renderItem("f2", Icons.notifications, "静音频道"),
                  renderItem("f3", Icons.settings, "设置"),
                  renderItem("f4", Icons.add, "添加成员", hideBorder: true),
                ],
              );
              if (result != null) {}
              print(result);
              setState(() {
                hover = -1;
              });
            },
            child: Container(
              height: 29.w,
              padding: EdgeInsets.only(right: 12.w, left: 12.w),
              child: Icon(Icons.adaptive.more, size: 17.w, color: ConstTheme.sidebarText.withAlpha(155)),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 2.w,
                  color: currentId == channelsList[index].id ? ConstTheme.sidebarTextActiveBorder : Colors.transparent,
                ),
              ),
            ),
            width: double.maxFinite,
            // padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w, top: 5.w, bottom: 5.w),
                  child: Icon(Icons.private_connectivity, size: 24.w, color: ConstTheme.sidebarText.withAlpha(155)),
                ),
                SizedBox(width: 8.w),
                Text(
                  channelsList[index].name,
                  style: TextStyle(
                    fontSize: 15.w,
                    fontWeight: FontWeight.normal,
                    color: ConstTheme.sidebarText.withAlpha(155),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  PopupMenuItem<String> renderItem(value, icon, name, {hideBorder = false}) {
    return PopupMenuItem<String>(
      padding: EdgeInsets.zero,
      height: 25.w,
      value: value,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          border: Border(
              bottom: !hideBorder ? BorderSide(color: ConstTheme.sidebarText.withOpacity(0.08)) : BorderSide.none),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10.w),
            Icon(icon, color: ConstTheme.sidebarText.withOpacity(0.7), size: 16.w),
            SizedBox(width: 6.w),
            Text(name, style: TextStyle(color: ConstTheme.sidebarText.withOpacity(0.7), fontSize: 12.w, height: 1)),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}
