import 'package:dtim/application/store/theme.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dtim/infra/components/avatar.dart';

void main() {
  testWidgets("test Avatar", (WidgetTester tester) async {
    initScreen(1200);
    await tester.pumpWidget(
      MaterialApp(
        theme: getDefaultTheme(),
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
