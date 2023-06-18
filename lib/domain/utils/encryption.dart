import 'package:dtim/application/store/app/app.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter/material.dart';

import 'package:dtim/application/store/theme.dart';
import 'package:matrix/matrix.dart';

import 'functions.dart';
import 'matrix_sdk_extensions/matrix_locals.dart';

void verifyOrRequestKey(BuildContext context, Event event) async {
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
