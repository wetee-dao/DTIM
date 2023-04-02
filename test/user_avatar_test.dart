import 'package:asyou_app/router.dart';
import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/components/user_avatar.dart';
import 'package:matrix/matrix.dart';
import 'package:matrix/src/user.dart';

void main() {
  testWidgets("test user_avatar.dart", (WidgetTester tester) async {
    initScreen(1200);

    await tester.pumpWidget(
      MaterialApp(
        theme: theme(),
        navigatorKey: rootNavigatorKey,
        home: const Scaffold(
          body: UserAvatar(
            "https://www.asyou.me/static/temp/images/icon-152x152.png",
            true,
            40,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  });

  testWidgets("test user_avatar.dart", (WidgetTester tester) async {
    initScreen(1200);
    await tester.pumpWidget(
      MaterialApp(
        theme: theme(),
        navigatorKey: rootNavigatorKey,
        home: const Scaffold(
          body: UserAvatarWithPop(
            "1",
            "name",
            true,
            40,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  });
}
