import 'package:dtim/domain/utils/functions.dart';
import 'package:flutter/material.dart';

import 'package:webview_cef/webview_cef.dart';

class CefView extends StatefulWidget {
  const CefView({Key? key}) : super(key: key);

  @override
  State<CefView> createState() => _CefViewState();
}

class _CefViewState extends State<CefView> {
  final _controller = WebViewController();
  String title = "Loading...";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String url = "https://apps.acala.network/";
    await _controller.initialize();
    await _controller.loadUrl(url);
    _controller.setWebviewListener(WebviewEventsListener(
      onTitleChanged: (t) {
        setState(() {
          title = t;
        });
      },
      onUrlChanged: (url) {
        // _textController.text = url;
      },
      onAllCookiesVisited: (cookies) {
        // allCookies = cookies;
      },
      onUrlCookiesVisited: (cookies) {
        for (final key in cookies.keys) {
          printInfo(key);
          // allCookies[key] = cookies[key];
        }
      },
    ));

    // 设置js to flutter 桥接
    final Set<JavascriptChannel> jsChannels = {
      JavascriptChannel(
        name: 'Print',
        onMessageReceived: (JavascriptMessage message) {
          _controller.sendJavaScriptChannelCallBack(
            false,
            "{'code':'200','message':'print succeed!'}",
            message.callbackId,
            message.frameId,
          );
        },
      ),
    };
    await _controller.setJavaScriptChannels(jsChannels);

    // 调用js代码
    await _controller.executeJavaScript("function abc(e){console.log(e)}");

    if (!mounted) return;
    setState(() {});
  }

  @override
  Future<void> dispose() async {
    // await _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(_controller);
  }
}
