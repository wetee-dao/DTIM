import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';

import 'package:dtim/domain/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/domain/utils/platform_infos.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/encryption.dart';

import 'audio_player.dart';
import 'cute_events.dart';
import 'group_call.dart';
import 'html.dart';
import 'image_bubble.dart';
import 'map_bubble.dart';
import 'download.dart';
import 'member.dart';
import 'sticker.dart';
import 'utils.dart';
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

  @override
  Widget build(BuildContext context) {
    final buttonTextColor = textColor;

    switch (event.type) {
      case EventTypes.Encryption:
        return Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
            border: Border.all(color: buttonTextColor.withOpacity(0.1)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: buttonTextColor.withOpacity(0.01),
                blurRadius: 8.w,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.task_rounded, color: buttonTextColor, size: 19.w),
              SizedBox(width: 5.w),
              Text(
                "启用了E2E加密",
                style: TextStyle(fontSize: 12.w, color: buttonTextColor),
              )
            ],
          ),
        );
      case EventTypes.RoomPowerLevels:
        return Container();
      case EventTypes.RoomJoinRules:
        var joinRule = event.content["join_rule"];
        if (joinRule == "invite") {
          return const RoomEvent(text: "设置频道加入规则为 邀请");
        } else if (joinRule == "public") {
          return const RoomEvent(text: "设置频道加入规则为 公开");
        } else {
          return Container();
        }
      case EventTypes.HistoryVisibility:
        var historyVisibility = event.content["history_visibility"];
        if (historyVisibility == "invited") {
          return RoomEvent(
            text: "设置频道历史消息可见性为 ${HistoryVisibility.invited.getLocalizedString(
              MatrixLocals(L10n.of(context)!),
            )}",
          );
        } else if (historyVisibility == "joined") {
          return RoomEvent(
            text: "设置频道历史消息可见性为 ${HistoryVisibility.joined.getLocalizedString(
              MatrixLocals(L10n.of(context)!),
            )}",
          );
        } else if (historyVisibility == "shared") {
          return RoomEvent(
            text: "设置频道历史消息可见性为 ${HistoryVisibility.shared.getLocalizedString(
              MatrixLocals(L10n.of(context)!),
            )}",
          );
        } else if (historyVisibility == "world_readable") {
          return RoomEvent(
            text: "设置频道历史消息可见性为 ${HistoryVisibility.worldReadable.getLocalizedString(
              MatrixLocals(L10n.of(context)!),
            )}",
          );
        } else {
          return Container();
        }
      case EventTypes.GuestAccess:
        var guestAccess = event.content["guest_access"];
        if (guestAccess == "can_join") {
          return const RoomEvent(
            text: "设置频道访客可加入",
          );
        } else if (guestAccess == "forbidden") {
          return const RoomEvent(
            text: "设置频道访客禁止加入",
          );
        } else {
          return Container();
        }
      case EventTypes.RoomName:
        return RoomEvent(
          text: "设置频道名称为 ${event.content["name"]}",
        );
      case EventTypes.Message:
      case EventTypes.Encrypted:
      case EventTypes.Sticker:
        switch (event.messageType) {
          case MessageTypes.Image:
            return ImageBubble(
              key: Key("${event.eventId}-img"),
              event,
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
              onPressed: () => verifyOrRequestKey(context, event),
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
        return RoomMemberContent(event, textColor);
      case EventTypes.GroupCallPrefix:
        return GroupCallContent(event, textColor);
      default:
        return _ButtonContent(
          label: L10n.of(context)!.userSentUnknownEvent(
            event.senderFromMemoryOrFallback.calcDisplayname(),
            event.type,
          ),
          icon: const Icon(Icons.info_outlined),
          textColor: buttonTextColor,
          onPressed: () => onInfoTab!(event),
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
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(label, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.w)),
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: constTheme.centerChannelBg,
        surfaceTintColor: constTheme.centerChannelBg,
        shadowColor: constTheme.centerChannelColor.withOpacity(0.01),
        padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 10.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.w),
        ),
        side: BorderSide(width: 1, color: constTheme.centerChannelColor.withOpacity(0.1)),
        elevation: 1,
      ),
    );
  }
}
