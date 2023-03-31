import 'package:asyou_app/router.dart';
import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/components/no_match_user.dart';

void main() {
  testWidgets("test no_match_user.dart", (WidgetTester tester) async {
    initScreen(1200);

    await tester.pumpWidget(
      MaterialApp(
        theme: theme(),
        navigatorKey: rootNavigatorKey,
        home: Scaffold(
          body: WidgetNoMatchUser(100, 100),
        ),
      ),
    );
    await tester.pumpAndSettle();
  });
}
