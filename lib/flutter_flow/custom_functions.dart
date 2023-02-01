import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

List<dynamic> newCustomFunction(List<dynamic> listOfItems) {
  print('Anujesh');
  print(listOfItems);
  return listOfItems;
}

String findProductImage(
  List<dynamic> customAttributes,
  String imsgBaseUrl,
) {
  String defaultImg =
      "https://www.slntechnologies.com/wp-content/uploads/2017/08/ef3-placeholder-image.jpg";

  if (customAttributes.isNotEmpty) {
    var b = customAttributes.where((d) => d["attribute_code"] == "image");

    if (b.isEmpty) {
      return defaultImg;
    } else {
      return imsgBaseUrl + b.first["value"];
    }
  } else {
    return defaultImg;
  }
}

List<String> createCategoryList(
  List<dynamic> allCategoryList,
  int filtterId,
) {
  List<String> newList = [];

  allCategoryList.forEach((element) {
    if (element["parent_id"] == filtterId) {
      newList.add("${element["id"]} ${element["name"]}");
    }
  });

  return newList;
}

String getShopUrl() {
  String url = "shop${DateTime.now().millisecondsSinceEpoch}";
  print("urladsad " + url);
  return url;
}
