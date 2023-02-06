import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LanguageSelectionWidget extends StatefulWidget {
  const LanguageSelectionWidget({Key? key}) : super(key: key);

  @override
  _LanguageSelectionWidgetState createState() =>
      _LanguageSelectionWidgetState();
}

class _LanguageSelectionWidgetState extends State<LanguageSelectionWidget> {
  String? radioButtonValue;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select language',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-0.8, 0.45),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
            child: FlutterFlowRadioButton(
              options: ['French', 'English'].toList(),
              onChanged: (val) => setState(() => radioButtonValue = val),
              optionHeight: 25,
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
              buttonPosition: RadioButtonPosition.left,
              direction: Axis.vertical,
              radioButtonColor: Colors.blue,
              inactiveRadioButtonColor: Color(0x8A000000),
              toggleable: false,
              horizontalAlignment: WrapAlignment.start,
              verticalAlignment: WrapCrossAlignment.start,
            ),
          ),
        ),
      ],
    );
  }
}
