// Copyright 2023 FluffyChat.
// This file is part of FluffyChat

// Licensed under the AGPL;
//
// https://gitlab.com/famedly/fluffychat
//
import 'dart:io';

import 'package:asyou_app/router.dart';
import 'package:asyou_app/application/store/im_state.dart';
import 'package:flutter/foundation.dart';

import 'package:desktop_lifecycle/desktop_lifecycle.dart';
import 'package:desktop_notifications/desktop_notifications.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:http/http.dart' as http;
import 'package:matrix/matrix.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;

import 'matrix_sdk_extensions/matrix_locals.dart';
import 'platform_infos.dart';

extension LocalNotificationsExtension on ImState {
  void showLocalNotification(EventUpdate eventUpdate) async {
    final roomId = eventUpdate.roomID;
    if (activeRoomId == roomId) {
      if (kIsWeb) return;
      if (PlatformInfos.isLinux && DesktopLifecycle.instance.isActive.value) {
        return;
      }
    }
    final room = client.getRoomById(roomId);
    if (room == null) {
      Logs().w('Can not display notification for unknown room $roomId');
      return;
    }
    if (room.notificationCount == 0) return;
    final event = Event.fromJson(eventUpdate.content, room);
    final title = room.getLocalizedDisplayname(MatrixLocals(L10n.of(globalCtx())!));
    final body = await event.calcLocalizedBody(
      MatrixLocals(L10n.of(globalCtx())!),
      withSenderNamePrefix: !room.isDirectChat || room.lastEvent?.senderId == client.userID,
      plaintextBody: true,
      hideReply: true,
      hideEdit: true,
      removeMarkdown: true,
    );
    final icon = event.senderFromMemoryOrFallback.avatarUrl?.getThumbnail(
          client,
          width: 64,
          height: 64,
          method: ThumbnailMethod.crop,
        ) ??
        room.avatar?.getThumbnail(
          client,
          width: 64,
          height: 64,
          method: ThumbnailMethod.crop,
        );
    if (kIsWeb) {
      html.AudioElement()
        ..src = 'assets/assets/sounds/WoodenBeaver_stereo_message-new-instant.ogg'
        ..autoplay = true
        ..load();
      html.Notification(
        title,
        body: body,
        icon: icon.toString(),
      );
    } else if (PlatformInfos.isLinux) {
      final appIconUrl = room.avatar?.getThumbnail(
        room.client,
        width: 56,
        height: 56,
      );
      File? appIconFile;

      if (appIconUrl != null && appIconUrl.toString() != "") {
        final tempDirectory = await getApplicationSupportDirectory();
        final avatarDirectory = await Directory('${tempDirectory.path}/notiavatars/').create();
        appIconFile = File(
          '${avatarDirectory.path}/${Uri.encodeComponent(appIconUrl.toString())}',
        );
        if (await appIconFile.exists() == false) {
          final response = await http.get(appIconUrl);
          await appIconFile.writeAsBytes(response.bodyBytes);
        }
      }
      final notification = await linuxNotifications!.notify(
        title,
        body: body,
        replacesId: linuxNotificationId ?? 0,
        appName: "Wetee",
        appIcon: appIconFile?.path ?? '',
        actions: [
          NotificationAction(
            DesktopNotificationActions.openChat.name,
            L10n.of(globalCtx())!.openChat,
          ),
          NotificationAction(
            DesktopNotificationActions.seen.name,
            L10n.of(globalCtx())!.markAsRead,
          ),
        ],
        hints: [
          NotificationHint.soundName('message-new-instant'),
        ],
      );
      notification.action.then((actionStr) {
        final action = DesktopNotificationActions.values.singleWhere((a) => a.name == actionStr);
        switch (action) {
          case DesktopNotificationActions.seen:
            room.setReadMarker(event.eventId, mRead: event.eventId);
            break;
          case DesktopNotificationActions.openChat:
            // VRouter.of(navigatorContext).toSegments(['rooms', room.id]);
            break;
        }
      });
      linuxNotificationId = notification.id;
    }
  }
}

enum DesktopNotificationActions { seen, openChat }
