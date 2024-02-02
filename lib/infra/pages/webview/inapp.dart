
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InappView extends StatefulWidget {
  // final PopBrowser browser = PopBrowser();
  InappView({Key? key}) : super(key: key);

  @override
  State<InappView> createState() => _InappViewState();
}

class _InappViewState extends State<InappView> {
  String title = "Loading...";

  @override
  void initState() {
    super.initState();

    // pullToRefreshController = kIsWeb || ![TargetPlatform.iOS, TargetPlatform.android].contains(defaultTargetPlatform)
    //     ? null
    //     : PullToRefreshController(
    //         settings: PullToRefreshSettings(
    //           color: Colors.black,
    //         ),
    //         onRefresh: () async {
    //           if (PlatformInfos.isAndroid) {
    //             widget.browser.webViewController?.reload();
    //           } else if (PlatformInfos.isIOS) {
    //             widget.browser.webViewController
    //                 ?.loadUrl(urlRequest: URLRequest(url: await widget.browser.webViewController?.getUrl()));
    //           }
    //         },
    //       );
    // widget.browser.pullToRefreshController = pullToRefreshController;
  }

  @override
  Future<void> dispose() async {
    // await _controller.dispose();
    super.dispose();
  }

  // PullToRefreshController? pullToRefreshController;

  @override
  Widget build(BuildContext context) {
    // final constTheme = Theme.of(context).extension<ExtColors>()!;
    return ElevatedButton(
      onPressed: () async {
        // await widget.browser.openUrlRequest(
        //   // https://apps.acala.network/
        //   urlRequest: URLRequest(url: WebUri("https://bifrost.app/")),
        //   settings: InAppBrowserClassSettings(
        //     browserSettings: InAppBrowserSettings(
        //       presentationStyle: ModalPresentationStyle.NONE,
        //       toolbarTopBackgroundColor: constTheme.sidebarBg,
        //       windowType: WindowType.CHILD,
        //       // hideToolbarTop: true,
        //       hideUrlBar: true,
        //       hideToolbarBottom: true,
        //       hideTitleBar: true,
        //     ),
        //     webViewSettings: InAppWebViewSettings(
        //       isInspectable: kDebugMode,
        //       useShouldOverrideUrlLoading: true,
        //       useOnLoadResource: true,
        //     ),
        //   ),
        // );
      },
      child: Text("Open In-App Browser"),
    );
  }
}

// class PopBrowser extends InAppBrowser {
//   PopBrowser({int? windowId, UnmodifiableListView<UserScript>? initialUserScripts})
//       : super(windowId: windowId, initialUserScripts: initialUserScripts);

//   @override
//   Future onBrowserCreated() async {
//     print("\n\nBrowser Created!\n\n");
//   }

//   @override
//   Future onLoadStart(url) async {}

//   @override
//   Future onLoadStop(url) async {
//     pullToRefreshController?.endRefreshing();
//   }

//   @override
//   Future<PermissionResponse> onPermissionRequest(request) async {
//     return PermissionResponse(resources: request.resources, action: PermissionResponseAction.GRANT);
//   }

//   @override
//   void onLoadError(url, code, message) {
//     pullToRefreshController?.endRefreshing();
//   }

//   @override
//   void onProgressChanged(progress) {
//     if (progress == 100) {
//       pullToRefreshController?.endRefreshing();
//     }
//   }

//   @override
//   void onExit() {
//     print("\n\nBrowser closed!\n\n");
//   }

//   @override
//   Future<NavigationActionPolicy> shouldOverrideUrlLoading(navigationAction) async {
//     print("\n\nOverride ${navigationAction.request.url}\n\n");
//     return NavigationActionPolicy.ALLOW;
//   }
// }
