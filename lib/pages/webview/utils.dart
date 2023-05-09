
import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:path_provider/path_provider.dart';

import '../../apis/system_api.dart';

openWindow() async{
  final winsystem = SystemApi.create().get();
  final webview = await WebviewWindow.create(
    configuration: CreateConfiguration(
      windowHeight: winsystem!.height.toInt(),
      windowWidth: winsystem.width.toInt(),
      title: "ExampleTestWindow",
      titleBarTopPadding: Platform.isMacOS ? 20 : 0,
      userDataFolderWindows: await _getWebViewPath(),
    ),
  );
  webview
    ..registerJavaScriptMessageHandler("test", (name, body) {
      print('on javaScipt message: $name $body');
    })
    ..setApplicationNameForUserAgent("WebviewExample/1.0.0")
    ..setPromptHandler((prompt, defaultText) {
      if (prompt == "test") {
        return "Hello World!";
      } else if (prompt == "init") {
        return "initial prompt";
      }
      return "";
    })
  ..addScriptToExecuteOnDocumentCreated("""
    const mixinContext = {
      platform: 'Desktop',
      conversation_id: 'conversationId',
      immersive: false,
      app_version: '1.0.0',
      appearance: 'dark',
    }
    window.MixinContext = {
      getContext: function() {
        return JSON.stringify(mixinContext)
      }
    }
  """)
  ..launch("https://bifrost.subsquare.io/");
}

Future<String> _getWebViewPath() async {
  final document = await getApplicationDocumentsDirectory();
  return p.join(
    document.path,
    'desktop_webview_window',
  );
}
