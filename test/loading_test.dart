import 'package:asyou_app/router.dart';
import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asyou_app/components/loading.dart';

void main() {
  testWidgets("test loading", (WidgetTester tester) async {
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
                  waitFutureLoading(
                    context: rootNavigatorKey.currentContext!,
                    future: () async {
                      await Future.delayed(const Duration(seconds: 1));
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
