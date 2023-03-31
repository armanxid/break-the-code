import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  String? value;
  String? title;
  WebViewPage({Key? key, this.value, this.title}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState(value, title);
}

class _WebViewPageState extends State<WebViewPage> {
  String? value;
  String? title;
  WebViewController? _controller;

  _WebViewPageState(this.value, this.title);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(value!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 152, 241, 155),
        appBar: AppBar(
          title: Text(title!),
          actions: [],
        ),
        body: WebViewWidget(
          controller: _controller!,
        ));
  }
}
