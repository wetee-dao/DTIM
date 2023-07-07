import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dtim/infra/components/hover_list_item.dart';

void main() {
  testWidgets("test Avatar", (WidgetTester tester) async {
    initScreen(1200);
    await tester.pumpWidget(
      MaterialApp(
        theme: getDefaultTheme(),
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
