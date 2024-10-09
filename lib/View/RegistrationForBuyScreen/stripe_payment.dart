import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../CustomWidget/CustomAppbar/custom_appbar.dart';
class StripePaymentScreen extends StatefulWidget {
  StripePaymentScreen({super.key,required this.pay_url});
  String pay_url;
  @override
  State<StripePaymentScreen> createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  String ? url;
  var controller ;

@override
  void initState() {
  controller = WebViewController()
    ..setJavaScriptMode(
        JavaScriptMode.unrestricted)

    ..setNavigationDelegate(

      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('${widget.pay_url}')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('${widget.pay_url}'));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  //  print("ddddddddddddddddddddddddddddddddddddddddddd ------>  ${widget.pay_url}");
    return Scaffold(
      appBar: PreferredSize(preferredSize:Size.fromHeight(75), child: CustomAppbar()),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child:

        WebViewWidget(
            controller: controller),
      ),
    );
  }
}
