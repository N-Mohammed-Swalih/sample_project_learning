import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main(){
  runApp(MaterialApp());
}

class WebViewEx extends StatefulWidget {
  const WebViewEx({super.key});

  @override
  State<WebViewEx> createState() => _WebViewExState();
}

class _WebViewExState extends State<WebViewEx> {
  @override
  
  late WebViewController  controller;

  void initState() {
    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse("https://www.porsche.com/middle-east/_india_/"));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Webview'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}