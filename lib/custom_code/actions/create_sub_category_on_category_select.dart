// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

List<String> createSubCategoryOnCategorySelect(
  String selectedCategory,
  List<dynamic> allCategoryList,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  List<String> newList = [];
  String filtterId = selectedCategory
      .substring(0, selectedCategory.length)
      .substring(0, selectedCategory.indexOf(' '));

  allCategoryList.forEach((element) {
    if (element["parent_id"].toString() == filtterId) {
      newList.add("${element["id"]} ${element["name"]}");
    }
  });

  return newList;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
