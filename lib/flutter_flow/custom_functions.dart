import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

List<dynamic> newCustomFunction(dynamic listOfItems) {
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

dynamic createVendorUpdateList(String publicName) {
  List<Map<String, String>> listData = [];

  listData.add({"public_name": publicName});

  return json.encode(listData);
}

String findCompanyImagePath(
  dynamic jsonBody,
  String attributesName,
  String listName,
) {
  String defaultImg =
      "https://www.slntechnologies.com/wp-content/uploads/2017/08/ef3-placeholder-image.jpg";

  List<dynamic> customAttributes = jsonBody["data"][listName] ?? [];

  if (customAttributes.isNotEmpty) {
    //print(attributesName);
    var b = customAttributes.where((d) => d["label"] == attributesName);
    print(b);

    if (b.isEmpty) {
      return defaultImg;
    } else {
      return b.first["value"];
    }
  } else {
    return defaultImg;
  }
}

String getObjectFromList(
  List<dynamic> list,
  String searchLableName,
) {
  if (list == null) {
    return "";
  }
  if (list.isNotEmpty) {
    print(searchLableName);
    var b = list.where((d) => d["label"] == searchLableName);
    print(b);

    if (b.isEmpty) {
      return "";
    } else {
      return b.first["value"];
    }
  } else {
    return "";
  }
}

String getObjectFromAttributes(
  List<dynamic> attributesList,
  String attributesName,
) {
  if (attributesList.isNotEmpty) {
    var b = attributesList.where((d) => d["attribute_code"] == attributesName);

    if (b.isEmpty) {
      return "";
    } else {
      return b.first["value"];
    }
  } else {
    return "";
  }
}

String urlEncode(String value) {
  return Uri.encodeComponent("%${value}%");
}

String getObjectFromListCompanyProfile(
  dynamic jsonBody,
  String searchLableName,
  String listName,
) {
  List<dynamic> list = jsonBody["data"][listName] ?? [];

  if (list.isNotEmpty) {
    print(searchLableName);
    var b = list.where((d) => d["label"] == searchLableName);
    print(b);

    if (b.isEmpty) {
      return "";
    } else {
      return b.first["value"];
    }
  } else {
    return "";
  }
}

dynamic createManageProductJson(String searchItem) {
  Map<String, dynamic> mapData = Map<String, dynamic>();
  mapData = {"name": searchItem};
  return mapData;
}

String findImagePath(
  List<dynamic> customAttributes,
  String attributesName,
) {
  String defaultImg =
      "https://www.slntechnologies.com/wp-content/uploads/2017/08/ef3-placeholder-image.jpg";

  print(customAttributes);

  if (customAttributes.isNotEmpty) {
    print(attributesName);
    var b = customAttributes.where((d) => d["label"] == attributesName);
    print(b);

    if (b.isEmpty) {
      return defaultImg;
    } else {
      return b.first["value"];
    }
  } else {
    return defaultImg;
  }
}

int getSelectedCategoryId(String selectedCategoryId) {
  String filtterId = selectedCategoryId
      .substring(0, selectedCategoryId.length)
      .substring(0, selectedCategoryId.indexOf(' '));

  return int.parse(filtterId);
}

String findEditProdutFromJson(
  List<dynamic> list,
  String searchLabelName,
) {
  if (list.isNotEmpty) {
    var b = list.where((d) => d["attribute_code"] == searchLabelName);

    if (b.isEmpty) {
      return "";
    } else {
      return b.first["saved_value"].toString();
    }
  } else {
    return "";
  }
}

List<dynamic> isJsonFieldEmpty(
  dynamic response,
  String field,
) {
  var res = json.decode(response);
  return res["data"][field] ?? [];
}

dynamic updateUserDetailLocally(
  dynamic userDetailJson,
  String vendorname,
) {
  userDetailJson['vendor_name'] = vendorname;
  return userDetailJson;
}

String findWebsiteId(List<dynamic> websiteIdList) {
  if (websiteIdList.isNotEmpty) {
    var b = websiteIdList.where((d) => d == 1);

    if (b.isEmpty) {
      return "0";
    } else {
      return b.toString().replaceAll("(", "").replaceAll(")", "");
    }
  } else {
    return "0";
  }
}

List<String> makePreSelectedCategoryList(
  List<dynamic> categoryList,
  List<dynamic> selectedCategoryList,
) {
  //print(categoryList);

  print('----------- $selectedCategoryList ');
  List<String> newList = [];

  categoryList.forEach((value) {
    if (categoryList.contains(value["id"])) {
      newList.add("${value["id"]} ${value["name"]}");
    }
  });

  print('First newList $newList');
  return newList;
}

List<int> dynamicToInt(List<dynamic> listData) {
  print(listData);
  List<int> newList = [];
  listData.forEach((value) {
    newList.add(value);
  });

  print('NewList:--$newList');
  return newList;
}
