import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/components/close_bar.dart';

void main() {
  testWidgets("test CloseBar", (WidgetTester tester) async {
    initScreen(1200);
    await tester.pumpWidget(
      MaterialApp(
        theme: theme(),
        home: const CloseBar(
          child: Text("Test"),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text("Test"), findsOneWidget);
  });
}
