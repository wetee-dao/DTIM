import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dtim/infra/components/model_bar.dart';

void main() {
  testWidgets("test ModelBar", (WidgetTester tester) async {
    initScreen(1200);

    await tester.pumpWidget(MaterialApp(theme: theme(), home: Scaffold(appBar: ModelBar(title: "Test"))));
    await tester.pumpAndSettle();
    expect(find.text("Test"), findsOneWidget);
  });
}
