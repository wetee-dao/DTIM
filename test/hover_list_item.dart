import 'package:asyou_app/application/store/theme.dart';
import 'package:asyou_app/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/infra/components/hover_list_item.dart';

void main() {
  testWidgets("test Avatar", (WidgetTester tester) async {
    initScreen(1200);
    await tester.pumpWidget(
      MaterialApp(
        theme: theme(),
        home: HoverListItem(
          onPressed: () {},
          subkey: 'test',
          child: const Text("test"),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text("test"), findsOneWidget);
  });
}
