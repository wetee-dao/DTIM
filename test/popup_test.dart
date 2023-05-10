import 'package:asyou_app/components/popup.dart';
import 'package:asyou_app/router.dart';
import 'package:asyou_app/store/theme.dart';
import 'package:asyou_app/utils/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("test user_avatar.dart", (WidgetTester tester) async {
    initScreen(1200);
    await tester.pumpWidget(
      MaterialApp(
        theme: theme(),
        navigatorKey: rootNavigatorKey,
        home: Scaffold(
          body: BasePopupMenu(
            verticalMargin: -1.w,
            horizontalMargin: 5.w,
            showArrow: false,
            pressType: PressType.singleClick,
            position: PreferredPosition.bottomLeft,
            child: Container(
              width: 100.w,
              height: 100.w,
              color: Colors.red,
            ),
            menuBuilder: () => Container(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  });
}
