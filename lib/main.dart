import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NePOS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'NePOS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  static const platform =
  const MethodChannel('com.pax.demo.base');

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
