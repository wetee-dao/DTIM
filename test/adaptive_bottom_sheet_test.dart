import 'package:asyou_app/router.dart';
import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/utils/adaptive_bottom_sheet.dart';

void main() {
  testWidgets("test adaptive_bottom_sheet", (WidgetTester tester) async {
    initScreen(1200);
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: rootNavigatorKey,
        theme: theme(),
        home: Scaffold(
          body: Column(
            children: [
              InkWell(
                key: const Key('auto_test'),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
                onTap: () {
                  print("test");
                  showAdaptiveBottomSheet(
                    context: rootNavigatorKey!.currentContext!,
                    builder: (context) {
                      return Container(
                        height: 100,
                        width: 100,
                        color: Colors.red,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    // 触发注册按钮点击
    await tester.tap(find.byKey(const Key('auto_test')));
    await tester.pumpAndSettle();
  });
}
