// Copyright 2023 FluffyChat.
// This file is part of FluffyChat

// Licensed under the AGPL;
//
// https://gitlab.com/famedly/fluffychat
//

import 'package:flutter/material.dart';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';

import 'image_bubble.dart';

class Sticker extends StatefulWidget {
  final Event event;

  const Sticker(this.event, {Key? key}) : super(key: key);

  @override
  StickerState createState() => StickerState();
}

class StickerState extends State<Sticker> {
  bool? animated;

  @override
  Widget build(BuildContext context) {
    return ImageBubble(
      widget.event,
      fit: BoxFit.contain,
      onTap: () {
        setState(() => animated = true);
        showOkAlertDialog(
          context: context,
          message: widget.event.body,
          okLabel: L10n.of(context)!.ok,
        );
      },
      animated: animated ?? true,
    );
  }
}
