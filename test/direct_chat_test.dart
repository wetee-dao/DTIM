import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/components/direct_chat.dart';

void main() {
  testWidgets("test DirectChats", (WidgetTester tester) async {
    initScreen(1200);
    await tester.pumpWidget(
      MaterialApp(theme: theme(), home: DirectChats([], "", () {})),
    );

    await tester.pumpAndSettle();
  });
}
