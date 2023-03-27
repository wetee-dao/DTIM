import 'dart:io';
import 'dart:ui';

import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

showtray() async {
  await trayManager.setIcon(
    'assets/images/top_bar${window.platformBrightness == Brightness.dark ? "_dark" : ""}${Platform.isWindows ? '.ico' : '.png'}',
  );

  List<MenuItem> items = [
    MenuItem(
      key: 'show_window',
      label: 'Show Window',
      onClick: (e) {
        windowManager.show();
      },
    ),
    MenuItem(
      key: 'exit_app',
      label: 'Exit App',
      onClick: (e) {
        windowManager.close();
      },
    ),
  ];

  await trayManager.setContextMenu(Menu(items: items));
  trayManager.addListener(TrayManagerListener());
}

class TrayManagerListener implements TrayListener {
  @override
  void onTrayIconMouseDown() {}
  @override
  void onTrayIconMouseUp() {}
  @override
  void onTrayIconRightMouseDown() {}
  @override
  void onTrayIconRightMouseUp() {}
  @override
  void onTrayMenuItemClick(MenuItem menuItem) {
    print("onTrayMenuItemClickonTrayMenuItemClick");
  }
}
