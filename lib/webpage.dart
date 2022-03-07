
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key, required this.title}) : super(key: key);
  static const platform =
  const MethodChannel('com.pax.demo.base');

  final String title;

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsFlutterBinding.ensureInitialized();
    return const Scaffold(
        body: SafeArea(
          child: WebView(
            // debuggingEnabled: true,
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'http://cucina.softwarecompanynepal.com',
          ),
        )
    );
  }
}