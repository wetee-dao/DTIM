import 'dart:async';
import 'package:flutter/material.dart';

import 'package:dtim/application/store/theme.dart';

Future<LoadingDialogResult<T>> waitFutureLoading<T>({
  required BuildContext context,
  required Future<T> Function() future,
  String? title,
  String? backLabel,
  String Function(dynamic exception)? onError,
  bool barrierDismissible = false,
}) async {
  final dialog = LoadingDialog<T>(
    future: future,
    title: title,
    backLabel: backLabel,
    onError: onError,
  );
  final result = await showDialog<LoadingDialogResult<T>>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) => dialog,
  );
  return result ??
      LoadingDialogResult<T>(
        error: Exception('FutureDialog canceled'),
        stackTrace: StackTrace.current,
      );
}

class LoadingDialog<T> extends StatefulWidget {
  final String? title;
  final String? backLabel;
  final Future<T> Function() future;
  final String Function(dynamic exception)? onError;

  static String defaultTitle = 'Loading... Please Wait!';
  static String defaultBackLabel = 'Back';
  // ignore: prefer_function_declarations_over_variables
  static String Function(dynamic exception) defaultOnError = (exception) => exception.toString();

  const LoadingDialog({
    Key? key,
    required this.future,
    this.title,
    this.onError,
    this.backLabel,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _LoadingDialogState<T> createState() => _LoadingDialogState<T>();
}

class _LoadingDialogState<T> extends State<LoadingDialog> {
  dynamic exception;
  StackTrace? stackTrace;

  @override
  void initState() {
    super.initState();
    widget.future().then(
          (result) => Navigator.of(context).pop<LoadingDialogResult<T>>(LoadingDialogResult(result: result)),
          onError: (e, s) => setState(
            () {
              exception = e;
              stackTrace = s;
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    final titleLabel = exception != null
        ? widget.onError?.call(exception) ?? LoadingDialog.defaultOnError(exception)
        : widget.title ?? LoadingDialog.defaultTitle;
    final content = Padding(
      padding: const EdgeInsets.only(right: 16.0, top: 26.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          exception == null
              ? CircularProgressIndicator.adaptive(
                  backgroundColor: constTheme.centerChannelColor.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(constTheme.centerChannelColor),
                )
              : const Icon(Icons.error_outline_outlined, color: Colors.red),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              titleLabel,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );

    return AlertDialog(
      content: content,
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? constTheme.centerChannelBg : Colors.white,
      actions: [
        if (exception != null)
          TextButton(
            onPressed: () => Navigator.of(context).pop<LoadingDialogResult<T>>(
              LoadingDialogResult(
                error: exception,
                stackTrace: stackTrace,
              ),
            ),
            child: Text(
              widget.backLabel ?? LoadingDialog.defaultBackLabel,
              style: TextStyle(color: constTheme.centerChannelColor),
            ),
          ),
      ],
    );
  }
}

class LoadingDialogResult<T> {
  final T? result;
  final dynamic error;
  final StackTrace? stackTrace;

  LoadingDialogResult({this.result, this.error, this.stackTrace});
}
