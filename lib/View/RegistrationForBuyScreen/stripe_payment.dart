import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class StripePaymentScreen extends StatefulWidget {
  StripePaymentScreen({super.key,required this.pay_url});
  String pay_url;
  @override
  State<StripePaymentScreen> createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  String ? url;
  var controller = WebViewController()
    ..setJavaScriptMode(
        JavaScriptMode.unrestricted)

  ..setNavigationDelegate(

      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },



        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.tflserutest.co.uk/api/payment/pay/cs_test_a1uw49zidiChmQweWLrgYlSL1mWyv7Q98oyQDUhXiUcOEjcizXn2iLle1c')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://www.tflserutest.co.uk/'));

  @override
  Widget build(BuildContext context) {
  //  print("ddddddddddddddddddddddddddddddddddddddddddd ------>  ${widget.pay_url}");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child:

        WebViewWidget(
            controller: controller),
      ),
    );
  }
}
