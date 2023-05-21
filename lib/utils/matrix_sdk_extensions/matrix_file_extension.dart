// Copyright 2023 FluffyChat.
// This file is part of FluffyChat

// Licensed under the AGPL;
//
// https://gitlab.com/famedly/fluffychat
//

import 'dart:io';
import 'package:asyou_app/utils/screen/screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:matrix/matrix.dart';

import '../platform_infos.dart';
import '../string.dart';

Future<File> getLocalSupportFile(String name) async {
  if(isPc()){
    final dir = await getDownloadsDirectory();
    if(dir!=null){
      return File('${dir.path}/$name');
    }
  }
  final dir = await getApplicationDocumentsDirectory();
  return File('${dir.path}/$name');
}

extension MatrixFileExtension on MatrixFile {
  void save(BuildContext context) async {
    if (PlatformInfos.isIOS) {
      return share(context);
    }
    final fileName = name.split('/').last;
    final file = await getLocalSupportFile(fileName);
    BotToast.showText(
      text: "File save at ${file.path}",
      duration: const Duration(seconds: 2),
    );

    await file.writeAsBytes(bytes);
  }

  void share(BuildContext context) async {
    // Workaround for iPad from
    // https://github.com/fluttercommunity/plus_plugins/tree/main/packages/share_plus/share_plus#ipad
    // final box = context.findRenderObject() as RenderBox?;

    // await Share.shareXFiles(
    //   [XFile.fromData(bytes)],
    //   sharePositionOrigin: box == null ? null : box.localToGlobal(Offset.zero) & box.size,
    // );
    return;
  }

  MatrixFile get detectFileType {
    if (msgType == MessageTypes.Image) {
      return MatrixImageFile(bytes: bytes, name: name);
    }
    if (msgType == MessageTypes.Video) {
      return MatrixVideoFile(bytes: bytes, name: name);
    }
    if (msgType == MessageTypes.Audio) {
      return MatrixAudioFile(bytes: bytes, name: name);
    }
    return this;
  }

  String get sizeString => size.sizeString;
}
