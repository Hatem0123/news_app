import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
   WebViewScreen({super.key,this.url});

   late final WebViewController controller=
   WebViewController()..loadRequest(Uri.parse(url!)
   );
   String? url;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:WebViewWidget(controller: controller)
    );
  }
}
