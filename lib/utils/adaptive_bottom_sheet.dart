// Copyright 2023 FluffyChat.
// This file is part of FluffyChat

// Licensed under the AGPL;
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.gnu.org/licenses
//

import 'package:flutter/material.dart';

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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.w),
          topRight: Radius.circular(5.w),
        ),
      ),
    );
