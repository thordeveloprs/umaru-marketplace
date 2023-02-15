// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'index.dart'; // Imports other custom widgets
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  double width, height;
  String url;
  PaymentWebView(
      {Key? key, required this.height, required this.width, required this.url})
      : super(key: key);
  @override
  _PaymentWebView createState() => _PaymentWebView();
}

class _PaymentWebView extends State<PaymentWebView> {
  bool isLoading = true;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void onInit() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      onProgress: (int progress) {
        print('WebView is loading (progress : $progress%)');
      },
      javascriptChannels: <JavascriptChannel>{
        _toasterJavascriptChannel(context),
      },
      navigationDelegate: (NavigationRequest request) {
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {
        print('Page finished loading: $url');
        if (url.startsWith(
                'https://staging.umarumart.com/csmarketplace/vendor') ||
            url.startsWith(
                'https://staging.umarumart.com/csmembership/membership')) {
          Future.delayed(Duration(seconds: 10), () {
            context.pushNamed('Home');
          });
        }
      },
      zoomEnabled: true,
      debuggingEnabled: false,
      userAgent:
          "Mozilla/5.0 (Linux; Android 4.4.4; One Build/KTU84L.H4) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/33.0.0.0 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/28.0.0.20.16;]",
      gestureNavigationEnabled: true,
      backgroundColor: const Color(0x00000000),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
