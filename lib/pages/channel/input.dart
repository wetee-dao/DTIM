import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:matrix/matrix.dart' as link;

import '../../components/popup.dart';
import '../../models/models.dart';
import '../../store/theme.dart';
import '../../objectbox.g.dart';
import '../../utils/screen.dart';

// ignore: must_be_immutable
class ChannelInputPage extends StatefulWidget {
  final link.Room room;

  const ChannelInputPage({Key? key, required this.room}) : super(key: key);

  @override
  State<ChannelInputPage> createState() => _ChannelInputPageState();
}

class _ChannelInputPageState extends State<ChannelInputPage> {
  final _msgController = TextEditingController();
  final BasePopupMenuController emojiController = BasePopupMenuController();
  final StreamController<bool> emojiStreamController = StreamController<bool>();
  final TextEditingController _controller = TextEditingController();

  late final _msgNode = FocusNode(
    onKey: (FocusNode node, RawKeyEvent evt) {
      if (!evt.isShiftPressed && evt.logicalKey.keyLabel == 'Enter') {
        if (evt is RawKeyDownEvent) {
          if (_msgController.text == "") return KeyEventResult.handled;

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
        border: Border(top: BorderSide(color: ConstTheme.centerChannelColor.withOpacity(0.08))),
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
              focusNode: _msgNode,
            ),
          ),
          BasePopupMenu(
            verticalMargin: 0.w,
            horizontalMargin: 0.w,
            showArrow: false,
            controller: emojiController,
            position: PreferredPosition.topRight,
            pressType: PressType.singleClick,
            child: StreamBuilder<bool>(
              stream: emojiStreamController.stream,
              initialData: false,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return Icon(
                  snapshot.data != null && snapshot.data!
                      ? Icons.emoji_emotions_outlined
                      : Icons.sentiment_satisfied_alt_outlined,
                  color: ConstTheme.centerChannelColor.withAlpha(150),
                  size: 25.w,
                );
              },
            ),
            menuBuilder: () => Container(
              width: 400.w,
              height: 300.w,
              margin: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                border: Border.all(color: ConstTheme.centerChannelColor.withOpacity(0.08)),
                borderRadius: BorderRadius.circular(3.w),
                color: ConstTheme.centerChannelBg,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6.w,
                  ),
                ],
              ),
              child: EmojiPicker(
                textEditingController: _msgController,
                onEmojiSelected: (Category? category, Emoji emoji) {
                  emojiController.hideMenu();
                  FocusScope.of(context).requestFocus(_msgNode);
                },
                config: Config(
                  columns: 7,
                  emojiSizeMax: 28.w,
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  gridPadding: EdgeInsets.zero,
                  initCategory: Category.RECENT,
                  bgColor: ConstTheme.centerChannelBg,
                  indicatorColor: ConstTheme.centerChannelColor,
                  iconColor: ConstTheme.centerChannelColor,
                  iconColorSelected: ConstTheme.sidebarTextActiveBorder,
                  backspaceColor: ConstTheme.centerChannelColor,
                  skinToneDialogBgColor: Colors.white,
                  skinToneIndicatorColor: Colors.grey,
                  enableSkinTones: true,
                  showRecentsTab: true,
                  recentsLimit: 28,
                  replaceEmojiOnLimitExceed: false,
                  noRecents: Text(
                    'No Recents',
                    style: TextStyle(fontSize: 20.w, color: ConstTheme.centerChannelColor),
                    textAlign: TextAlign.center,
                  ),
                  loadingIndicator: const SizedBox.shrink(),
                  tabIndicatorAnimDuration: kTabScrollDuration,
                  categoryIcons: const CategoryIcons(),
                  buttonMode: ButtonMode.MATERIAL,
                  checkPlatformCompatibility: true,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: () {
              if (_msgController.text == "") return;
              widget.room.sendTextEvent(_msgController.text);
              _msgController.clear();
              setState(() {
                msg = "";
              });
            },
            child: Icon(
              Icons.send,
              color: ConstTheme.centerChannelColor.withAlpha(150),
              size: 25.w,
            ),
          ),
        ],
      ),
    );
  }
}
