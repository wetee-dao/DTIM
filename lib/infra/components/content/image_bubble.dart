// Copyright 2023 FluffyChat.
// This file is part of FluffyChat

// Licensed under the AGPL;
//
// https://gitlab.com/famedly/fluffychat
//

import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/infra/pages/utils/image_viewer/image_viewer.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:matrix/matrix.dart';

import 'package:dtim/infra/components/mxc_image.dart';
import 'package:dtim/application/store/theme.dart';

class ImageBubble extends StatefulWidget {
  final Event event;
  final bool tapToView;
  final BoxFit fit;
  final bool maxSize;
  final Color? backgroundColor;
  final bool thumbnailOnly;
  final bool animated;
  final void Function()? onTap;

  const ImageBubble(
    this.event, {
    this.tapToView = true,
    this.maxSize = true,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.thumbnailOnly = true,
    this.animated = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<ImageBubble> createState() => _ImageBubbleState();
}

class _ImageBubbleState extends State<ImageBubble> {
  @override
  void initState() {
    printError("initStateinitStateinitState");
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ImageBubble oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  Widget _buildPlaceholder(BuildContext context) {
    if (widget.event.messageType == MessageTypes.Sticker) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    final String blurHashString = widget.event.infoMap['xyz.amorgan.blurhash'] is String
        ? widget.event.infoMap['xyz.amorgan.blurhash']
        : 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';
    final ratio = widget.event.infoMap['w'] is int && widget.event.infoMap['h'] is int
        ? widget.event.infoMap['w'] / widget.event.infoMap['h']
        : 1.0;
    var width = 32;
    var height = 32;
    if (ratio > 1.0) {
      height = (width / ratio).round();
    } else {
      width = (height * ratio).round();
    }
    return SizedBox(
      width: 400,
      height: 300,
      child: BlurHash(
        hash: blurHashString,
        decodingWidth: width,
        decodingHeight: height,
        imageFit: widget.fit,
      ),
    );
  }

  void _onTap(BuildContext context) {
    if (widget.onTap != null) {
      widget.onTap!();
      return;
    }
    if (!widget.tapToView) return;
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (_) => ImageViewer(widget.event),
    );
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return InkWell(
      onTap: () => _onTap(context),
      child: Container(
        constraints: widget.maxSize
            ? const BoxConstraints(
                maxWidth: 200,
                maxHeight: 150,
              )
            : null,
        decoration: BoxDecoration(
          border: Border.all(width: 4.w, color: constTheme.centerChannelColor.withOpacity(0.1)),
        ),
        child: MxcImage(
          event: widget.event,
          width: 200,
          height: 150,
          fit: widget.fit,
          animated: widget.animated,
          isThumbnail: widget.thumbnailOnly,
          placeholder: _buildPlaceholder,
        ),
      ),
    );
  }
}
