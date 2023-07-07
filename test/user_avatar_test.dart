import 'package:dtim/router.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dtim/infra/components/avatar.dart';

void main() {
  testWidgets("test user_avatar.dart", (WidgetTester tester) async {
    initScreen(1200);

    await tester.pumpWidget(
      MaterialApp(
        theme: getDefaultTheme(),
        navigatorKey: rootNavigatorKey,
        home: const Scaffold(
          body: BaseAvatar(
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
        theme: getDefaultTheme(),
        navigatorKey: rootNavigatorKey,
        home: const Scaffold(
          body: BaseAvatarWithPop(
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
