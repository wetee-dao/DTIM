import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/components/search_element.dart';

void main() {
  testWidgets("test search_element.dart", (WidgetTester tester) async {
    initScreen(1200);

    await tester.pumpWidget(
      MaterialApp(
        theme: theme(),
        home: Scaffold(
          body: WidgetSearchElement(Icons.add_circle_outline, 'Add a Workspace', Icons.access_time, '  '),
        ),
      ),
    );
    await tester.pumpAndSettle();
  });
}
