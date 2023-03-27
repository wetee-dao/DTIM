import 'dart:io';
import 'dart:ui';

import 'package:tray_manager/tray_manager.dart';

showtray() async {
  await trayManager.setIcon(
    'assets/images/top_bar${window.platformBrightness == Brightness.dark ? "_dark" : ""}${Platform.isWindows ? '.ico' : '.png'}',
  );

  List<MenuItem> items = [
    MenuItem(
      key: 'show_window',
      label: 'Show Window',
    ),
    MenuItem(
      key: 'exit_app',
      label: 'Exit App',
    ),
  ];

  await trayManager.setContextMenu(Menu(items: items));
}
