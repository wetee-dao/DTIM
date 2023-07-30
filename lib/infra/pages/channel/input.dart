import 'dart:async';
import 'dart:io';

import 'package:dtim/infra/components/command_palette.dart';
import 'package:dtim/router.dart';
import 'package:dtim/domain/utils/localized_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:file_picker/file_picker.dart';
import 'package:matrix/matrix.dart' as link;
import 'package:record/record.dart';

import 'package:dtim/infra/components/popup.dart';
import 'package:dtim/infra/components/recording_dialog.dart';
import 'package:dtim/infra/components/send_file_dialog.dart';
import 'package:dtim/domain/models/models.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/platform_infos.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/domain/utils/matrix_sdk_extensions/matrix_file_extension.dart';

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
  link.Event? replyEvent;

  final _msgNode = FocusNode();
  late Account me;
  String msg = "";
  String srcAvatar = "";
  String nameAuthor = "";

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

  void onAddPopupMenuButtonSelected(String choice) {
    if (choice == 'file') {
      sendFileAction();
    }
    if (choice == 'image') {
      sendImageAction();
    }
    if (choice == 'camera') {
      openCameraAction();
    }
    if (choice == 'camera-video') {
      openVideoCameraAction();
    }
    // if (choice == 'sticker') {
    //   sendStickerAction();
    // }
    if (choice == 'location') {
      sendLocationAction();
    }
  }

  void sendFileAction() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      withData: true,
    );
    if (result == null || result.files.isEmpty) return;
    await showDialog(
      context: globalCtx(),
      useRootNavigator: false,
      builder: (c) => SendFileDialog(
        files: result.files
            .map(
              (xfile) => link.MatrixFile(
                bytes: xfile.bytes!,
                name: xfile.name,
              ).detectFileType,
            )
            .toList(),
        room: widget.room,
      ),
    );
  }

  void sendImageAction() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
      allowMultiple: true,
    );
    if (result == null || result.files.isEmpty) return;

    await showDialog(
      context: globalCtx(),
      useRootNavigator: false,
      builder: (c) => SendFileDialog(
        files: result.files
            .map(
              (xfile) => link.MatrixFile(
                bytes: xfile.bytes!,
                name: xfile.name,
              ).detectFileType,
            )
            .toList(),
        room: widget.room,
      ),
    );
  }

  void openCameraAction() async {
    // Make sure the textfield is unfocused before opening the camera
    FocusScope.of(context).requestFocus(FocusNode());
    final file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file == null) return;
    final bytes = await file.readAsBytes();
    await showDialog(
      context: globalCtx(),
      useRootNavigator: false,
      builder: (c) => SendFileDialog(
        files: [
          link.MatrixImageFile(
            bytes: bytes,
            name: file.path,
          )
        ],
        room: widget.room,
      ),
    );
  }

  void openVideoCameraAction() async {
    // Make sure the textfield is unfocused before opening the camera
    FocusScope.of(context).requestFocus(FocusNode());
    final file = await ImagePicker().pickVideo(source: ImageSource.camera);
    if (file == null) return;
    final bytes = await file.readAsBytes();
    await showDialog(
      context: globalCtx(),
      useRootNavigator: false,
      builder: (c) => SendFileDialog(
        files: [
          link.MatrixVideoFile(
            bytes: bytes,
            name: file.path,
          )
        ],
        room: widget.room,
      ),
    );
  }

  // void sendStickerAction() async {
  //   final sticker = await showAdaptiveBottomSheet<link.ImagePackImageContent>(
  //     context: context,
  //     builder: (c) => StickerPickerDialog(room: widget.room),
  //   );
  //   if (sticker == null) return;
  //   final eventContent = <String, dynamic>{
  //     'body': sticker.body,
  //     if (sticker.info != null) 'info': sticker.info,
  //     'url': sticker.url.toString(),
  //   };
  //   // send the sticker
  //   await widget.room.sendEvent(
  //     eventContent,
  //     type: link.EventTypes.Sticker,
  //   );
  // }

  void voiceMessageAction() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    if (await Record().hasPermission() == false) return;
    final result = await showDialog<RecordingResult>(
      context: globalCtx(),
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (c) => const RecordingDialog(),
    );

    if (result == null) return;
    final audioFile = File(result.path);
    final file = link.MatrixAudioFile(
      bytes: audioFile.readAsBytesSync(),
      name: audioFile.path,
    );
    await widget.room.sendFileEvent(
      file,
      inReplyTo: replyEvent,
      extraContent: {
        'info': {
          ...file.info,
          'duration': result.duration,
        },
        'org.matrix.msc3245.voice': {},
        'org.matrix.msc1767.audio': {
          'duration': result.duration,
          'waveform': result.waveform,
        },
      },
    ).catchError((e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(
            (e as Object).toLocalizedString(context),
          ),
        ),
      );
      return null;
    });
    setState(() {
      replyEvent = null;
    });
  }

  void sendLocationAction() async {
    // await showDialog(
    //   context: context,
    //   useRootNavigator: false,
    //   builder: (c) => SendLocationDialog(room: room),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Container(
      height: 66.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: constTheme.centerChannelBg,
        border: Border(top: BorderSide(color: constTheme.centerChannelDivider)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 25.w,
            height: 25.w,
            child: PopupMenuButton<String>(
              icon: Container(
                alignment: Alignment.center,
                width: 25.w,
                height: 25.w,
                decoration: BoxDecoration(
                  color: constTheme.centerChannelColor.withAlpha(200),
                  borderRadius: BorderRadius.circular(25.w),
                ),
                child: Icon(
                  Icons.add,
                  color: constTheme.centerChannelBg,
                  size: 20.w,
                ),
              ),
              padding: EdgeInsets.zero,
              onSelected: onAddPopupMenuButtonSelected,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'file',
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.attachment_outlined),
                    ),
                    title: Text(L10n.of(context)!.sendFile),
                    contentPadding: const EdgeInsets.all(0),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'image',
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.image_outlined),
                    ),
                    title: Text(L10n.of(context)!.sendImage),
                    contentPadding: const EdgeInsets.all(0),
                  ),
                ),
                if (PlatformInfos.isMobile)
                  PopupMenuItem<String>(
                    value: 'camera',
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.camera_alt_outlined),
                      ),
                      title: Text(L10n.of(context)!.openCamera),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                  ),
                if (PlatformInfos.isMobile)
                  PopupMenuItem<String>(
                    value: 'camera-video',
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.videocam_outlined),
                      ),
                      title: Text(L10n.of(context)!.openVideoCamera),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                  ),
                // if (widget.room.getImagePacks(ImagePackUsage.sticker).isNotEmpty)
                //   PopupMenuItem<String>(
                //     value: 'sticker',
                //     child: ListTile(
                //       leading: const CircleAvatar(
                //         backgroundColor: Colors.orange,
                //         foregroundColor: Colors.white,
                //         child: Icon(Icons.emoji_emotions_outlined),
                //       ),
                //       title: Text(L10n.of(context)!.sendSticker),
                //       contentPadding: const EdgeInsets.all(0),
                //     ),
                //   ),
                if (PlatformInfos.isMobile)
                  PopupMenuItem<String>(
                    value: 'location',
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.brown,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.gps_fixed_outlined),
                      ),
                      title: Text(L10n.of(context)!.shareLocation),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            flex: 1,
            child: TextFormField(
              key: const Key("chatInput"),
              controller: _msgController,
              style: TextStyle(
                color: constTheme.centerChannelColor,
                fontSize: 15.w,
              ),
              autofocus: false,
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
                buildCommandPalette(e);
                setState(() {
                  msg = e;
                });
              },
              onFieldSubmitted: (v) {
                if (_msgController.text == "") return;
                widget.room.sendTextEvent(_msgController.text);
                _msgController.clear();
                setState(() {
                  msg = "";
                });
                FocusScope.of(context).requestFocus(_msgNode);
              },
              cursorColor: constTheme.centerChannelColor,
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
                  color: constTheme.centerChannelColor.withAlpha(150),
                  size: 25.w,
                );
              },
            ),
            menuBuilder: () => Container(
              width: 400.w,
              height: 300.w,
              margin: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                border: Border.all(color: constTheme.centerChannelColor.withOpacity(0.08)),
                borderRadius: BorderRadius.circular(3.w),
                color: constTheme.centerChannelBg,
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
                  bgColor: constTheme.centerChannelBg,
                  indicatorColor: constTheme.centerChannelColor,
                  iconColor: constTheme.centerChannelColor,
                  iconColorSelected: constTheme.sidebarTextActiveBorder,
                  backspaceColor: constTheme.centerChannelColor,
                  skinToneDialogBgColor: Colors.white,
                  skinToneIndicatorColor: Colors.grey,
                  enableSkinTones: true,
                  // showRecentsTab: true,
                  recentsLimit: 28,
                  replaceEmojiOnLimitExceed: false,
                  noRecents: Text(
                    'No Recents',
                    style: TextStyle(fontSize: 20.w, color: constTheme.centerChannelColor),
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
          SizedBox(width: 8.w),
          if (msg == "")
            IconButton(
              key: const Key("voice"),
              tooltip: "voice",
              onPressed: voiceMessageAction,
              constraints: BoxConstraints(minWidth: 35.w, maxWidth: 35.w, minHeight: 35.w, maxHeight: 35.w),
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.mic_none_outlined,
                color: constTheme.centerChannelColor.withAlpha(150),
                size: 25.w,
              ),
            ),
          if (msg != "")
            IconButton(
              key: const Key("chatSendIcon"),
              tooltip: "send",
              constraints: BoxConstraints(minWidth: 35.w, maxWidth: 35.w, minHeight: 35.w, maxHeight: 35.w),
              padding: EdgeInsets.zero,
              onPressed: () {
                if (_msgController.text == "") return;
                widget.room.sendTextEvent(_msgController.text);
                _msgController.clear();
                setState(() {
                  msg = "";
                });
              },
              icon: Icon(
                Icons.send,
                color: constTheme.centerChannelColor.withAlpha(150),
                size: 25.w,
              ),
            ),
        ],
      ),
    );
  }

  OverlayEntry? overlayEntry;
  buildCommandPalette(String msg) {
    if (!msg.startsWith("/")) {
      if (overlayEntry != null) {
        overlayEntry!.remove();
        setState(() {
          overlayEntry = null;
        });
      }
      return;
    } else {
      if (overlayEntry != null) {
        return;
      }
    }

    final constTheme = Theme.of(globalCtx()).extension<ExtColors>()!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    overlayEntry = OverlayEntry(
      maintainState: true,
      builder: (context) => Listener(
        behavior: HitTestBehavior.opaque,
        onPointerDown: (PointerDownEvent event) {
          Offset poffset = event.localPosition;
          if (poffset.dy < offset.dy - 200.w || poffset.dx < offset.dx) {
            if (overlayEntry != null) {
              overlayEntry!.remove();
              setState(() {
                overlayEntry = null;
              });
            }
          }
        },
        // onPointerHover: (PointerHoverEvent event) {
        //   Offset poffset = event.localPosition;
        //   if (poffset.dy < offset.dy || poffset.dy > offset.dy + size.height || poffset.dx < offset.dx) {
        //     if (overlayEntry != null) {
        //       overlayEntry!.remove();
        //       setState(() {
        //         overlayEntry = null;
        //       });
        //     }
        //     return;
        //   }
        // },
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: size.width - 30.w,
                margin: EdgeInsets.only(
                  left: offset.dx - 2.w,
                  // top: offset.dy - size.height,
                ),
                decoration: BoxDecoration(
                  color: constTheme.centerChannelBg.darker(0.05),
                  // borderRadius: BorderRadius.circular(10.w),
                ),
                child: CommandPalette(
                  room: widget.room,
                  msgController: _msgController,
                  onChanged: (e) {
                    buildCommandPalette(e);
                  },
                ),
              ),
              SizedBox(height: 15.w),
            ],
          ),
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry!);
    setState(() {});
    // Timer(const Duration(milliseconds: 100), () {
    //   FocusScope.of(context).requestFocus(_commandNode);
    // });
  }
}
