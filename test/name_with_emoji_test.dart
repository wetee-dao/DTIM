import 'package:asyou_app/router.dart';
import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/components/name_with_emoji.dart';

void main() {
  testWidgets("test name_with_emoji.dart", (WidgetTester tester) async {
    initScreen(1200);

    await tester.pumpWidget(
      MaterialApp(
        theme: theme(),
        navigatorKey: rootNavigatorKey,
        home: Scaffold(
          body: WidgetUserNameEmoji("Test", null),
        ),
      ),
    );
    await tester.pumpAndSettle();
  });
}
