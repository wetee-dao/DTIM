// Copyright 2023 FluffyChat.
// This file is part of FluffyChat

// Licensed under the AGPL;
//
// https://gitlab.com/famedly/fluffychat
//

import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';

import '../../../store/theme.dart';

class VerificationRequestContent extends StatelessWidget {
  final Event event;
  final Timeline timeline;

  const VerificationRequestContent({
    required this.event,
    required this.timeline,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final events = event.aggregatedEvents(timeline, 'm.reference');
    final done = events.where((e) => e.type == EventTypes.KeyVerificationDone);
    final start = events.where((e) => e.type == EventTypes.KeyVerificationStart);
    final cancel = events.where((e) => e.type == EventTypes.KeyVerificationCancel);
    final fullyDone = done.length >= 2;
    final started = start.isNotEmpty;
    final canceled = cancel.isNotEmpty;
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: constTheme.centerChannelColor.withOpacity(0.1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.lock_outlined,
            size: 16.w,
            color: canceled ? Colors.red : (fullyDone ? Colors.green : constTheme.centerChannelColor),
          ),
          const SizedBox(width: 8),
          Text(
            canceled
                ? 'Error ${cancel.first.content.tryGet<String>('code')}: ${cancel.first.content.tryGet<String>('reason')}'
                : (fullyDone
                    ? L10n.of(context)!.verifySuccess
                    : (started ? L10n.of(context)!.loadingPleaseWait : L10n.of(context)!.newVerificationRequest)),
            style: TextStyle(color: constTheme.centerChannelColor, fontSize: 14.w),
          )
        ],
      ),
    );
  }
}
