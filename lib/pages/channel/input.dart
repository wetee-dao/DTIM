import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:asyou_app/objectbox.g.dart';
import 'package:asyou_app/utils/screen/size_extension.dart';
import 'package:matrix/matrix.dart' as link;

import '../../models/models.dart';
import '../../store/theme.dart';

// ignore: must_be_immutable
class ChannelInputPage extends StatefulWidget {
  final link.Room room;

  const ChannelInputPage({Key? key, required this.room}) : super(key: key);

  @override
  State<ChannelInputPage> createState() => _ChannelInputPageState();
}

class _ChannelInputPageState extends State<ChannelInputPage> {
  final _msgController = TextEditingController();
  late final _focusNode = FocusNode(
    onKey: (FocusNode node, RawKeyEvent evt) {
      if (!evt.isShiftPressed && evt.logicalKey.keyLabel == 'Enter') {
        if (evt is RawKeyDownEvent) {
          widget.room.sendTextEvent(_msgController.text);
          _msgController.clear();
          setState(() {
            msg = "";
          });
        }
        return KeyEventResult.handled;
      } else {
        return KeyEventResult.ignored;
      }
    },
  );
  late Account me;
  String msg = "";

  String srcAvatar = "";
  String nameAuthor = "";

  Condition<ImMessages>? get condition => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _msgController.dispose();
    super.dispose();
  }

  getUserName(User u) {
    if (u.name != "") {
      return u.name;
    }
    return u.address;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.w,
      // margin: EdgeInsets.only(
      //   left: 20.w,
      //   right: 20.w,
      //   top: 3.w,
      //   bottom: 20.w,
      // ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
      decoration: BoxDecoration(
        color: ConstTheme.centerChannelBg,
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.red.withOpacity(0.8),
        //     blurRadius: 2,
        //   ),
        // ],
        border: Border(top: BorderSide(color: ConstTheme.centerChannelColor.withOpacity(0.03))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 25.w,
            height: 25.w,
            decoration: BoxDecoration(
              color: ConstTheme.centerChannelColor.withAlpha(150),
              borderRadius: BorderRadius.circular(25.w),
            ),
            child: Icon(
              Icons.add,
              color: ConstTheme.centerChannelBg,
              size: 20.w,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            flex: 1,
            child: TextField(
              controller: _msgController,
              style: TextStyle(
                color: ConstTheme.centerChannelColor,
                fontSize: 15.w,
              ),
              autofocus: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: '发送消息至 ${widget.room.name}',
                hintStyle: TextStyle(
                  height: 1.5,
                  color: ConstTheme.sidebarText.withAlpha(155),
                ),
                contentPadding: const EdgeInsets.all(0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                label: null,
              ),
              onChanged: (e) {
                setState(() {
                  msg = e;
                });
              },
              cursorColor: ConstTheme.centerChannelColor,
              focusNode: _focusNode,
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.room.sendTextEvent(_msgController.text);
              _msgController.clear();
              setState(() {
                msg = "";
              });
            },
            child: Icon(
              msg != "" ? Icons.send : Icons.emoji_emotions_outlined,
              color: ConstTheme.centerChannelColor.withAlpha(150),
              size: 25.w,
            ),
          ),
        ],
      ),
    );
  }
}
