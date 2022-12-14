import 'dart:io';                            // Add this import.
import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'src/web_view_stack.dart';  // Add this import
import 'dart:async';                                    // Add this import
import 'package:webview_flutter/webview_flutter.dart';  // Add this import back
import 'src/navigation_controls.dart';                  // Add this import
import 'package:pull_to_refresh/pull_to_refresh.dart';


void main() {
  runApp(
    const MaterialApp(
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();

}


class _WebViewAppState extends State<WebViewApp> {
  final controller = Completer<WebViewController>();    // Instantiate the controller
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  // Add from here ...
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }
  // ... to here.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SolidApp'),
        // Add from here ...
        actions: [
          NavigationControls(controller: controller),

        ],
        // ... to here.
      ),
      body: WebViewStack(controller: controller),       // Add the controller argument
    );
  }
}