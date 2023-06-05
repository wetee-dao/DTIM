// Copyright 2023 FluffyChat.
// This file is part of FluffyChat

// Licensed under the AGPL;
//
// https://gitlab.com/famedly/fluffychat
//

import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/functions.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../store/im.dart';
import '../../../utils/matrix_sdk_extensions/matrix_locals.dart';
import '../../../utils/screen/screen.dart';
import '../../../utils/platform_infos.dart';
import 'audio_player.dart';
import 'cute_events.dart';
import 'group_call.dart';
import 'html.dart';
import 'image_bubble.dart';
import 'map_bubble.dart';
import 'download.dart';
import 'sticker.dart';
import 'video_player.dart';

class MessageContent extends StatelessWidget {
  final Event event;
  final Color textColor;
  final void Function(Event)? onInfoTab;

  const MessageContent(
    this.event, {
    this.onInfoTab,
    Key? key,
    required this.textColor,
  }) : super(key: key);

  void _verifyOrRequestKey(BuildContext context) async {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    printError("_verifyOrRequestKey_verifyOrRequestKey_verifyOrRequestKey");
    final l10n = L10n.of(context)!;
    if (event.content['can_request_session'] != true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            event.type == EventTypes.Encrypted
                ? l10n.needPantalaimonWarning
                : event.calcLocalizedBodyFallback(
                    MatrixLocals(l10n),
                  ),
          ),
        ),
      );
      return;
    }
    final im = context.read<AppCubit>();
    final client = im.currentState!.client;
    if (client.isUnknownSession && client.encryption!.crossSigning.enabled) {
      printError("client.isUnknownSession && client.encryption!.crossSigning.enabled");
      // final success = await BootstrapDialog(
      //   client: client,
      // ).show(context);
      // if (success != true) return;
    }
    event.requestKey();
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          l10n.whyIsThisMessageEncrypted,
          style: TextStyle(fontSize: 18.w),
        ),
        content: Text(
          event.calcLocalizedBodyFallback(MatrixLocals(l10n)),
          style: TextStyle(color: constTheme.centerChannelColor),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("确定"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonTextColor = textColor;
    switch (event.type) {
      case EventTypes.Message:
      case EventTypes.Encrypted:
      case EventTypes.Sticker:
        switch (event.messageType) {
          case MessageTypes.Image:
            return ImageBubble(
              event,
              width: 400,
              height: 300,
              fit: BoxFit.cover,
            );
          case MessageTypes.Sticker:
            if (event.redacted) continue textmessage;
            return Sticker(event);
          case CuteEventContent.eventType:
            return CuteContent(event);
          case MessageTypes.Audio:
            if (PlatformInfos.isMobile || PlatformInfos.isMacOS || PlatformInfos.isWeb || PlatformInfos.isLinux) {
              return AudioPlayerWidget(
                event,
                color: textColor,
              );
            }
            return MessageDownloadContent(event, textColor);
          case MessageTypes.Video:
            if (PlatformInfos.isMobile || PlatformInfos.isWeb) {
              return EventVideoPlayer(event);
            }
            return MessageDownloadContent(event, textColor);
          case MessageTypes.File:
            return MessageDownloadContent(event, textColor);

          case MessageTypes.Text:
          case MessageTypes.Notice:
          case MessageTypes.Emote:
            if (!event.redacted && event.isRichMessage) {
              var html = event.formattedText;
              if (event.messageType == MessageTypes.Emote) {
                html = '* $html';
              }
              // final bigEmotes = event.onlyEmotes && event.numberEmotes > 0 && event.numberEmotes <= 10;
              return HtmlMessage(
                html: html,
                defaultTextStyle: TextStyle(
                  color: textColor,
                  fontSize: 15.w,
                ),
                linkStyle: TextStyle(
                  color: textColor.withAlpha(150),
                  fontSize: 15.w,
                  decoration: TextDecoration.underline,
                  decorationColor: textColor.withAlpha(150),
                ),
                room: event.room,
                emoteSize: 15.w,
              );
            }
            // else we fall through to the normal message rendering
            continue textmessage;
          case MessageTypes.BadEncrypted:
          case EventTypes.Encrypted:
            return _ButtonContent(
              textColor: buttonTextColor,
              onPressed: () => _verifyOrRequestKey(context),
              icon: const Icon(Icons.lock_outline),
              label: L10n.of(context)!.encrypted,
            );
          case MessageTypes.Location:
            final geoUri = Uri.tryParse(event.content.tryGet<String>('geo_uri')!);
            if (geoUri != null && geoUri.scheme == 'geo') {
              final latlong = geoUri.path.split(';').first.split(',').map((s) => double.tryParse(s)).toList();
              if (latlong.length == 2 && latlong.first != null && latlong.last != null) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MapBubble(
                      latitude: latlong.first!,
                      longitude: latlong.last!,
                    ),
                    const SizedBox(height: 6),
                    OutlinedButton.icon(
                      icon: Icon(Icons.location_on_outlined, color: textColor),
                      onPressed: () {},
                      label: Text(
                        L10n.of(context)!.openInMaps,
                        style: TextStyle(color: textColor),
                      ),
                    ),
                  ],
                );
              }
            }
            continue textmessage;
          case MessageTypes.None:
          textmessage:
          default:
            if (event.redacted) {
              return FutureBuilder<User?>(
                future: event.redactedBecause?.fetchSenderUser(),
                builder: (context, snapshot) {
                  return _ButtonContent(
                    label: L10n.of(context)!.redactedAnEvent(
                      snapshot.data?.calcDisplayname() ?? event.senderFromMemoryOrFallback.calcDisplayname(),
                    ),
                    icon: const Icon(Icons.delete_outlined),
                    textColor: buttonTextColor,
                    onPressed: () => onInfoTab!(event),
                  );
                },
              );
            }
            // final bigEmotes = event.onlyEmotes && event.numberEmotes > 0 && event.numberEmotes <= 10;
            return FutureBuilder<String>(
              future: event.calcLocalizedBody(
                MatrixLocals(L10n.of(context)!),
                hideReply: true,
              ),
              builder: (context, snapshot) {
                return SelectableText(
                  snapshot.data ??
                      event.calcLocalizedBodyFallback(
                        MatrixLocals(L10n.of(context)!),
                        hideReply: true,
                      ),
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15.w,
                    decoration: event.redacted ? TextDecoration.lineThrough : null,
                  ),
                  // linkStyle: TextStyle(
                  //   color: textColor.withAlpha(150),
                  //   fontSize: 15.w,
                  //   decoration: TextDecoration.underline,
                  //   decorationColor: textColor.withAlpha(150),
                  // ),
                  // onLinkTap: (url) => {},
                );
              },
            );
        }
      case EventTypes.CallInvite:
        return FutureBuilder<User?>(
          future: event.fetchSenderUser(),
          builder: (context, snapshot) {
            return _ButtonContent(
              label: L10n.of(context)!.startedACall(
                snapshot.data?.calcDisplayname() ?? event.senderFromMemoryOrFallback.calcDisplayname(),
              ),
              icon: Icon(Icons.call_rounded, size: 17.w),
              textColor: buttonTextColor,
              onPressed: () => onInfoTab!(event),
            );
          },
        );
      case EventTypes.RoomMember:
        return SelectableText("已加入频道 ${event.room.name}",
            style: TextStyle(fontSize: 14.w, color: textColor.withAlpha(200)));
      case EventTypes.GroupCallPrefix:
        return GroupCallContent(event, textColor);
        // return FutureBuilder<User?>(
        //   future: event.fetchSenderUser(),
        //   builder: (context, snapshot) {
        //     return _ButtonContent(
        //       label: L10n.of(context)!.userSentUnknownEvent(
        //         snapshot.data?.calcDisplayname() ?? event.senderFromMemoryOrFallback.calcDisplayname(),
        //         event.type,
        //       ),
        //       icon: const Icon(Icons.info_outlined),
        //       textColor: buttonTextColor,
        //       onPressed: () => onInfoTab!(event),
        //     );
        //   },
        // );
      default:
        return FutureBuilder<User?>(
          future: event.fetchSenderUser(),
          builder: (context, snapshot) {
            return _ButtonContent(
              label: L10n.of(context)!.userSentUnknownEvent(
                snapshot.data?.calcDisplayname() ?? event.senderFromMemoryOrFallback.calcDisplayname(),
                event.type,
              ),
              icon: const Icon(Icons.info_outlined),
              textColor: buttonTextColor,
              onPressed: () => onInfoTab!(event),
            );
          },
        );
    }
  }
}

class _ButtonContent extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final Icon icon;
  final Color? textColor;

  const _ButtonContent({
    required this.label,
    required this.icon,
    required this.textColor,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(label, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.w)),
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: constTheme.centerChannelColor.withOpacity(0.08),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 10.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.w)),
          side: BorderSide.none,
        ),
        elevation: 0,
      ),
    );
  }
}
