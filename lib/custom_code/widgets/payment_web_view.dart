// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

class PaymentWebView extends StatefulWidget {
  double width, height;
  String url;
  PaymentWebView(
      {Key? key, required this.height, required this.width, required this.url})
      : super(key: key);
  @override
  _PaymentWebView createState() => _PaymentWebView();
}

class _PaymentWebView extends State<PaymentWebView> {
  bool isLoading = true;

  @override
  void onInit() {
    print("ASdad");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
