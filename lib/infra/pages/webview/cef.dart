import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/infra/components/close_bar.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:dtim/infra/components/components.dart';
import 'package:dtim/domain/utils/screen/screen.dart';
import 'package:dtim/application/store/theme.dart';
import 'package:webview_cef/webview_cef.dart';

@RoutePage(name: "webviewRoute")
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
    await _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return Scaffold(
      appBar: SideBarAppBar(
        height: 45.w,
        title: title,
        showMacosTop: false,
        leading: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Icon(
              AppIcons.sxgl,
              color: constTheme.sidebarHeaderTextColor,
              size: 22.w,
            ),
          ),
        ),
        tools: CloseBar(color: constTheme.sidebarText),
      ),
      body: WebView(_controller),
    );
  }
}
