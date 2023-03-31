import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/components/avatar.dart';

void main() {
  testWidgets("test Avatar", (WidgetTester tester) async {
    initScreen(1200);
    await tester.pumpWidget(
      MaterialApp(
        theme: theme(),
        home: const Avatar(
          id: "id",
          name: "test",
          size: Avatar.defaultSize * 3,
          fontSize: 36,
        ),
      ),
    );

    await tester.pumpAndSettle();
  });
}
