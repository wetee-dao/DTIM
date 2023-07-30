import 'package:dtim/infra/components/components.dart';
import 'package:dtim/infra/components/hover_list_item.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart' as link;

import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/application/store/theme.dart';

class CommandPalette extends StatefulWidget {
  final link.Room room;
  final TextEditingController msgController;
  final Function(String)? onChanged;
  const CommandPalette({Key? key, required this.room, required this.msgController, this.onChanged}) : super(key: key);

  @override
  State<CommandPalette> createState() => _CommandPaletteState();
}

class _CommandPaletteState extends State<CommandPalette> {
  final _commandNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final iconSize = BoxConstraints(minWidth: 40.w, maxWidth: 40.w, minHeight: 40.w, maxHeight: 40.w);
    final cmds = widget.room.client.commands;

    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 200.w,
            width: double.maxFinite,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(children: [
                SizedBox(height: 10.w),
                for (var key in cmds.keys)
                  HoverListItem(
                    onPressed: () {
                      widget.msgController.text = "/$key";
                      FocusScope.of(context).requestFocus(_commandNode);
                    },
                    subkey: key,
                    hoverColor: constTheme.centerChannelColor.withOpacity(0.08),
                    child: Container(
                      height: 40.w,
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          SizedBox(width: 5.w),
                          Icon(
                            AppIcons.command_line,
                            color: constTheme.centerChannelColor,
                            size: 18.w,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "/$key",
                            style: TextStyle(
                              color: constTheme.centerChannelColor,
                              height: 2,
                              fontSize: 14.w,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ]),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            decoration: BoxDecoration(
              color: constTheme.centerChannelBg.darker(0.1),
              // borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.w)),
            ),
            height: 50.w,
            child: Row(
              children: [
                IconButton(
                  tooltip: "commands",
                  padding: EdgeInsets.zero,
                  constraints: iconSize,
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.w))),
                  ),
                  icon: Icon(
                    AppIcons.command_line,
                    color: constTheme.centerChannelColor,
                    size: 18.w,
                  ),
                  onPressed: () async {
                    await widget.room.client.parseAndRunCommand(widget.room, "");
                  },
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    key: const Key("commandInput"),
                    focusNode: _commandNode,
                    controller: widget.msgController,
                    style: TextStyle(
                      color: constTheme.centerChannelColor,
                      fontSize: 15.w,
                    ),
                    autofocus: true,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: '发送消息至 ${widget.room.name}',
                      hintStyle: TextStyle(
                        height: 1.5,
                        color: constTheme.centerChannelColor.withAlpha(200),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      label: null,
                    ),
                    onChanged: (e) {
                      widget.onChanged?.call(e);
                      // setState(() {
                      //   msg = e;
                      // });
                    },
                    onFieldSubmitted: (v) async {
                      await widget.room.client.parseAndRunCommand(widget.room, v);
                      widget.msgController.text = "";
                      widget.onChanged?.call("");
                    },
                    cursorColor: constTheme.centerChannelColor,
                  ),
                ),
                // IconButton(
                //   padding: EdgeInsets.zero,
                //   constraints: iconSize,
                //   style: IconButton.styleFrom(
                //     shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                //   ),
                //   icon: Icon(
                //     Icons.reply_rounded,
                //     color: constTheme.centerChannelColor,
                //     size: 18.w,
                //   ),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
