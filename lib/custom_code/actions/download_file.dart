// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:io';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

Future<bool> downloadFile(
  String url,
  String name,
) async {
  String path = "/storage/emulated/0/Download";

  final completer = new Completer<bool>();

  if (Platform.isIOS) {
    final downloadFolder = await getDownloadsDirectory();
    if (downloadFolder != null) {
      path = downloadFolder.path;
    }
  } else {
    if (!await Directory(path).exists()) {
      await Directory(path).create(recursive: true);
    }
  }

  FileDownloader.downloadFile(
      url: url,
      name: name,
      onDownloadError: (String errorMessage) {
        print("downloading error => $errorMessage");
        completer.complete(false);
      },
      onDownloadCompleted: (path) {
        completer.complete(true);
        OpenFile.open(path);
      });

  return completer.future;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
