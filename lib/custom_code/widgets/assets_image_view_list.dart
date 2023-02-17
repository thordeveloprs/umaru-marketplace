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

class AssetsImageViewList extends StatefulWidget {
  double width, height;

  AssetsImageViewList({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<AssetsImageViewList> createState() => _AssetsImageViewList();
}

class _AssetsImageViewList extends State<AssetsImageViewList> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      children: FFAppState()
          .imageListForAddProduct
          .map((e) => Container(
                margin: const EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height * 0.13,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(e),
                    ),
                    Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              FFAppState()
                                  .imageBase64ListForAddProduct
                                  .removeAt(FFAppState()
                                      .imageListForAddProduct
                                      .indexOf(e));
                              FFAppState().imageListForAddProduct.remove(e);
                            });
                          },
                          child: const CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.red,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              )),
                        ))
                  ],
                ),
              ))
          .toList(),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
