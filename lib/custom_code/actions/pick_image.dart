// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';

pickImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (XFile != null) {
    File file = File(image!.path);
    List<int> imageBytes = file.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    Map<String, dynamic> contentMap = {
      "type": lookupMimeType(file.path),
      "name": basename(file.path),
      "base64_encoded_data": base64Image,
    };

    Map<String, dynamic> map = {
      "media_type": "image",
      "is_default": "true",
      "position": 12300,
      "content": contentMap,
    };

    FFAppState().imageListForAddProduct.add(file);
    FFAppState().imageBase64ListForAddProduct.add(map);
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
