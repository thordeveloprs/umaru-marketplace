// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

dynamic convertRegisterDataToJSON(
  String email,
  String firstname,
  String lastname,
  String password,
  bool issubscribed,
  String publicname,
  String shopurl,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  Map<String, dynamic> mapData = Map<String, dynamic>();

  List<Map<String, String>> listVendor = [];
  Map<String, String> vendorData = Map<String, String>();

  vendorData["key"] = "public_name";
  vendorData["value"] = publicname;
  listVendor.add(vendorData);

  vendorData["key"] = "shop_url";
  vendorData["value"] = shopurl;
  listVendor.add(vendorData);

  mapData["email"] = email;
  mapData["firstname"] = firstname;
  mapData["lastname"] = lastname;
  mapData["password"] = password;
  mapData["issubscribed"] = issubscribed;
  mapData["is_vendor"] = "1";
  mapData["is_vendor"] = listVendor;

  return json.encode(mapData);

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
