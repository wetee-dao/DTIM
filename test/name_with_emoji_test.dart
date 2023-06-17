import 'package:dtim/router.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dtim/infra/components/name_with_emoji.dart';

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
