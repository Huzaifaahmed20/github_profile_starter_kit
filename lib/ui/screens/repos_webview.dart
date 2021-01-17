import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReposWebView extends StatefulWidget {
  ReposWebView({Key key}) : super(key: key);

  @override
  _ReposWebViewState createState() => _ReposWebViewState();
}

class _ReposWebViewState extends State<ReposWebView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final repoUrl = ModalRoute.of(context).settings.arguments;

    return WebView(
      initialUrl: repoUrl,
    );
  }
}
