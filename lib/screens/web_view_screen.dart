import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String result;
  const WebViewScreen({Key? key, required this.result}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF474747),
              ),
              iconSize: 24.0,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
          ),
        ),
        body: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: widget.result,
            onWebViewCreated: (controller) {
              this.controller = controller;
            }),
      );
}
