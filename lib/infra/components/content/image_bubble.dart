// Copyright 2023 FluffyChat.
// This file is part of FluffyChat

// Licensed under the AGPL;
//
// https://gitlab.com/famedly/fluffychat
//

import 'package:asyou_app/domain/utils/functions.dart';
import 'package:asyou_app/infra/pages/utils/image_viewer/image_viewer.dart';
import 'package:asyou_app/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:matrix/matrix.dart';

import 'package:asyou_app/infra/components/mxc_image.dart';
import 'package:asyou_app/application/store/theme.dart';

class ImageBubble extends StatefulWidget {
  final Event event;
  final bool tapToView;
  final BoxFit fit;
  final bool maxSize;
  final Color? backgroundColor;
  final bool thumbnailOnly;
  final bool animated;
  final double width;
  final double height;
  final void Function()? onTap;

  const ImageBubble(
    this.event, {
    this.tapToView = true,
    this.maxSize = true,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.thumbnailOnly = true,
    this.width = 400,
    this.height = 300,
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
    printError("ImageBubbleImageBubbleImageBubble");
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
      width: widget.width,
      height: widget.height,
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
      child: Hero(
        tag: widget.event.eventId,
        child: Container(
          constraints: widget.maxSize
              ? BoxConstraints(
                  maxWidth: widget.width,
                  maxHeight: widget.height,
                )
              : null,
          decoration: BoxDecoration(
            border: Border.all(width: 4.w, color: constTheme.centerChannelColor.withOpacity(0.1)),
          ),
          child: MxcImage(
            event: widget.event,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            animated: widget.animated,
            isThumbnail: widget.thumbnailOnly,
            placeholder: _buildPlaceholder,
          ),
        ),
      ),
    );
  }
}
