import 'package:flutter/material.dart';

import '../../config/app_config.dart';
import './screen.dart';

Future<T?> showAdaptiveBottomSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool isDismissible = true,
  bool isScrollControlled = true,
}) =>
    showModalBottomSheet(
      context: context,
      builder: builder,
      useRootNavigator: isPc(),
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      constraints: BoxConstraints(
        maxHeight: 480.w,
        maxWidth: 500.w,
      ),
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppConfig.borderRadius),
          topRight: Radius.circular(AppConfig.borderRadius),
        ),
      ),
    );
