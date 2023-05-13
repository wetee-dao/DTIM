import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/components/app_bar.dart';

void main() {
  testWidgets("test LocalAppBar", (WidgetTester tester) async {
    initScreen(1200);

    await tester.pumpWidget(MaterialApp(theme: theme(), home: Scaffold(appBar: LocalAppBar(title: "Test"))));
    await tester.pumpAndSettle();
    expect(find.text("Test"), findsOneWidget);
  });
}
