import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class article_view extends StatefulWidget {
  late final String _newsUrl;
  article_view(this._newsUrl);

  @override
  _article_viewState createState() => _article_viewState();
}

class _article_viewState extends State<article_view> {
  // final Completer<WebViewController> controller =
  //     Completer<WebViewController>();
  late final WebViewController controller;
  @override
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (navigation) {
            if (navigation.url != widget._newsUrl) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget._newsUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.newspaper,
              color: const Color.fromARGB(255, 41, 39, 39),
            ),
            Text(
              'Smart',
              style: TextStyle(
                  color: Color.fromARGB(255, 41, 39, 39),
                  fontWeight: FontWeight.w600),
            ),
            GradientText(
              'Samachar',
              style: TextStyle(fontWeight: FontWeight.w600),
              colors: [
                Color.fromARGB(255, 108, 189, 255),
                Colors.pinkAccent,
                //add mroe colors here.
              ],
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
