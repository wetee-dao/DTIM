import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InappView extends StatefulWidget {
  const InappView({Key? key}) : super(key: key);

  @override
  State<InappView> createState() => _InappViewState();
}

class _InappViewState extends State<InappView> {
  String title = "Loading...";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Future<void> dispose() async {
    // await _controller.dispose();
    super.dispose();
  }

  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true);

  PullToRefreshController? pullToRefreshController;
  String url = "";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri("https://apps.acala.network/")),
      // initialUrlRequest:
      // URLRequest(url: WebUri(Uri.base.toString().replaceFirst("/#/", "/") + 'page.html')),
      // initialFile: "assets/index.html",
      initialUserScripts: UnmodifiableListView<UserScript>([]),
      initialSettings: settings,
      // contextMenu: contextMenu,
      pullToRefreshController: pullToRefreshController,
      onWebViewCreated: (controller) async {
        webViewController = controller;
      },
      onLoadStart: (controller, url) async {
        setState(() {
          this.url = url.toString();
        });
      },
      onPermissionRequest: (controller, request) async {
        return PermissionResponse(resources: request.resources, action: PermissionResponseAction.GRANT);
      },
      shouldOverrideUrlLoading: (controller, navigationAction) async {
        var uri = navigationAction.request.url!;
        if (!["http", "https", "file", "chrome", "data", "javascript", "about"].contains(uri.scheme)) {
          // if (await canLaunchUrl(uri)) {
          //   // Launch the App
          //   await launchUrl(
          //     uri,
          //   );
          //   // and cancel the request
          //   return NavigationActionPolicy.CANCEL;
          // }
        }
        return NavigationActionPolicy.ALLOW;
      },
      onLoadStop: (controller, url) async {
        pullToRefreshController?.endRefreshing();
        setState(() {
          this.url = url.toString();
        });
      },
      onReceivedError: (controller, request, error) {
        pullToRefreshController?.endRefreshing();
      },
      onProgressChanged: (controller, progress) {
        if (progress == 100) {
          pullToRefreshController?.endRefreshing();
        }
        setState(() {
          this.progress = progress / 100;
        });
      },
      onUpdateVisitedHistory: (controller, url, isReload) {
        setState(() {
          this.url = url.toString();
        });
      },
      onConsoleMessage: (controller, consoleMessage) {
        print(consoleMessage);
      },
    );
  }
}
