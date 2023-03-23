import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:matrix/encryption.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';

import '../../../config/app_config.dart';
import '../../../router.dart';
import '../../../store/im.dart';
import '../../../utils/string_ectenstion.dart';
import 'key_verification_dialog.dart';

class ChatEncryptionSettings extends StatefulWidget {
  final String roomId;
  const ChatEncryptionSettings({Key? key, required this.roomId}) : super(key: key);

  @override
  ChatEncryptionSettingsController createState() => ChatEncryptionSettingsController();
}

class ChatEncryptionSettingsController extends State<ChatEncryptionSettings> {
  late Room room;
  late Client? client;

  @override
  void initState() {
    super.initState();
    var im = context.read<IMProvider>();
    if (im.currentState != null) {
      client = im.currentState!.client;
      room = im.currentState!.client.getRoomById(widget.roomId)!;
    }
  }

  Future<void> unblock(DeviceKeys key) async {
    if (key.blocked) {
      await key.setBlocked(false);
    }
  }

  void enableEncryption(_) async {
    if (room.encrypted) {
      showOkAlertDialog(
        context: context,
        title: L10n.of(context)!.sorryThatsNotPossible,
        message: L10n.of(context)!.disableEncryptionWarning,
      );
      return;
    }
    if (room.joinRules == JoinRules.public) {
      showOkAlertDialog(
        context: context,
        title: L10n.of(context)!.sorryThatsNotPossible,
        message: L10n.of(context)!.noEncryptionForPublicRooms,
      );
      return;
    }
    if (!room.canChangeStateEvent(EventTypes.Encryption)) {
      showOkAlertDialog(
        context: context,
        title: L10n.of(context)!.sorryThatsNotPossible,
        message: L10n.of(context)!.noPermission,
      );
      return;
    }
    final consent = await showOkCancelAlertDialog(
      context: context,
      title: L10n.of(context)!.areYouSure,
      message: L10n.of(context)!.enableEncryptionWarning,
      okLabel: L10n.of(context)!.yes,
      cancelLabel: L10n.of(context)!.cancel,
    );
    if (consent != OkCancelResult.ok) return;
    await showFutureLoadingDialog(
      context: globalCtx(),
      future: () => room.enableEncryption(),
    );
  }

  void startVerification() async {
    final req = await room.client.userDeviceKeys[room.directChatMatrixID]!.startVerification();
    req.onUpdate = () {
      if (req.state == KeyVerificationState.done) {
        setState(() {});
      }
    };
    await KeyVerificationDialog(request: req).show(globalCtx());
  }

  void toggleDeviceKey(DeviceKeys key) {
    setState(() {
      key.setBlocked(!key.blocked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: room.client.onSync.stream.where(
        (s) => s.rooms?.join?[room.id] != null || s.deviceLists != null,
      ),
      builder: (context, _) => Scaffold(
        backgroundColor: ConstTheme.centerChannelBg,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.w, bottom: 15.w),
              child: SwitchListTile(
                secondary: CircleAvatar(
                  foregroundColor: ConstTheme.buttonColor,
                  backgroundColor: ConstTheme.buttonBg.withOpacity(0.6),
                  child: const Icon(Icons.lock_outlined),
                ),
                title: Text(
                  L10n.of(context)!.encryptThisChat,
                  style: TextStyle(
                    color: ConstTheme.centerChannelColor,
                    fontSize: 14.w,
                  ),
                ),
                value: room.encrypted,
                onChanged: enableEncryption,
              ),
            ),
            Divider(
              height: 1,
              color: ConstTheme.centerChannelColor.withOpacity(0.08),
            ),
            // if (room.isDirectChat)
            //   Padding(
            //     padding: EdgeInsets.all(16.w),
            //     child: SizedBox(
            //       width: double.infinity,
            //       child: ElevatedButton.icon(
            //         style: ButtonStyle(
            //           backgroundColor: MaterialStateProperty.resolveWith((states) => ConstTheme.centerChannelBg),
            //           padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 19.w, horizontal: 30.w)),
            //           side: MaterialStateProperty.all(BorderSide(
            //             color: ConstTheme.centerChannelColor.withOpacity(0.5),
            //             width: 1,
            //           )),
            //         ),
            //         onPressed: startVerification,
            //         icon: const Icon(Icons.verified_outlined),
            //         label: Text(
            //           L10n.of(context)!.verifyStart,
            //           style: TextStyle(
            //             color: ConstTheme.centerChannelColor,
            //             fontSize: 18.w,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            if (room.encrypted) ...[
              const SizedBox(height: 16),
              ListTile(
                title: Text(
                  L10n.of(context)!.deviceKeys,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ConstTheme.centerChannelColor,
                  ),
                ),
              ),
              StreamBuilder(
                stream: room.onUpdate.stream,
                builder: (context, snapshot) => FutureBuilder<List<DeviceKeys>>(
                  future: room.getUserDeviceKeys(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          '${L10n.of(context)!.oopsSomethingWentWrong}: ${snapshot.error}',
                        ),
                      );
                    }
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 2,
                        ),
                      );
                    }
                    final deviceKeys = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: deviceKeys.length,
                      itemBuilder: (BuildContext context, int i) => SwitchListTile(
                        value: !deviceKeys[i].blocked,
                        activeColor: deviceKeys[i].verified ? Colors.green : Colors.orange,
                        onChanged: (_) => toggleDeviceKey(deviceKeys[i]),
                        title: Row(
                          children: [
                            Icon(
                              deviceKeys[i].verified
                                  ? Icons.verified_outlined
                                  : deviceKeys[i].blocked
                                      ? Icons.block_outlined
                                      : Icons.info_outlined,
                              color: deviceKeys[i].verified
                                  ? Colors.green
                                  : deviceKeys[i].blocked
                                      ? Colors.red
                                      : Colors.orange,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              deviceKeys[i].deviceId ?? L10n.of(context)!.unknownDevice,
                              style: TextStyle(color: ConstTheme.centerChannelColor),
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Material(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppConfig.borderRadius,
                                  ),
                                ),
                                color: ConstTheme.centerChannelBg,
                                child: Padding(
                                  padding: EdgeInsets.all(4.w),
                                  child: Text(
                                    deviceKeys[i].userId,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: ConstTheme.centerChannelColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          deviceKeys[i].ed25519Key?.beautified ?? L10n.of(context)!.unknownEncryptionAlgorithm,
                          style: TextStyle(
                            color: ConstTheme.centerChannelColor,
                            fontSize: 13.w,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ] else
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    L10n.of(context)!.encryptionNotEnabled,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: ConstTheme.centerChannelColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
