import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import 'package:asyou_app/infra/components/components.dart';
import 'matrix_file_extension.dart';
import '../string.dart';

extension LocalizedBody on Event {
  Future<LoadingDialogResult<MatrixFile?>> _getFile(BuildContext context) => waitFutureLoading(
        context: context,
        future: downloadAndDecryptAttachment,
      );

  void saveFile(BuildContext context) async {
    final matrixFile = await _getFile(context);

    matrixFile.result?.save(context);
  }

  void shareFile(BuildContext context) async {
    final matrixFile = await _getFile(context);

    matrixFile.result?.share(context);
  }

  bool get isAttachmentSmallEnough => infoMap['size'] is int && infoMap['size'] < room.client.database!.maxFileSize;

  bool get isThumbnailSmallEnough =>
      thumbnailInfoMap['size'] is int && thumbnailInfoMap['size'] < room.client.database!.maxFileSize;

  bool get showThumbnail =>
      [MessageTypes.Image, MessageTypes.Sticker, MessageTypes.Video].contains(messageType) &&
      (kIsWeb || isAttachmentSmallEnough || isThumbnailSmallEnough || (content['url'] is String));

  String? get sizeString => content.tryGetMap<String, dynamic>('info')?.tryGet<int>('size')?.sizeString;
}
