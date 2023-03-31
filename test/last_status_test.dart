import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/components/last_status.dart';

void main() {
  testWidgets("test WidgetLastStatus", (WidgetTester tester) async {
    initScreen(1200);
    await tester.pumpWidget(
      MaterialApp(
        theme: theme(),
        home: Scaffold(
          body: Column(
            children: [WidgetLastStatus(':clock1:', 'test', 'Don\'t clear', Icons.close)],
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    // expect(find.text("test"), findsOneWidget);
  });
}
