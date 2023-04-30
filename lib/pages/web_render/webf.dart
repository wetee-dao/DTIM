import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webf/webf.dart';

import '../../router.dart';
import '../../store/theme.dart';

const jsonEn = JsonEncoder();
const jsonDe = JsonDecoder();

class WebFage extends StatefulWidget {
  final WebFNavigationAction action;
  const WebFage(this.action, {Key? key}) : super(key: key);

  @override
  State<WebFage> createState() => _WebFageState();
}

class _WebFageState extends State<WebFage> with RouteAware {
  late WebFNavigationDelegate navigationDelegate;
  late WebFJavaScriptChannel javaScriptChannel;
  late WebF webview;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didPush() {
    print("didPush");
  }

  @override
  void didPopNext() {
    javaScriptChannel.invokeMethod('onShow', "");
  }

  @override
  void initState() {
    // 创建页面代理
    navigationDelegate = WebFNavigationDelegate();
    navigationDelegate.setDecisionHandler((WebFNavigationAction action) async {
      if (action.navigationType == WebFNavigationType.navigate) {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return WebFage(action);
        }));
        return WebFNavigationActionPolicy.cancel;
      }
      return WebFNavigationActionPolicy.allow;
    });

    // 同JS通信
    javaScriptChannel = WebFJavaScriptChannel();
    javaScriptChannel.onMethodCall = onJavaScriptCall;

    webview = WebF(
      navigationDelegate: navigationDelegate,
      bundle: WebFBundle.fromUrl(widget.action.target),
      javaScriptChannel: javaScriptChannel,
      routeObserver: routeObserver,
    );

    // WebF.setHttpCacheMode(HttpCacheMode.NO_CACHE);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final constTheme = Theme.of(context).extension<ExtColors>()!;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: constTheme.centerChannelBg,
        body: webview,
      ),
    );
  }

  // JS调用dart
  Future<dynamic> onJavaScriptCall(String method, dynamic arguments) async {
    if (method == "Navigator.pop") {
      Navigator.pop(context);
      return;
    }
  }
}
