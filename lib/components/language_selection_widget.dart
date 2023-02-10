import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'language_selection_model.dart';
export 'language_selection_model.dart';

class LanguageSelectionWidget extends StatefulWidget {
  const LanguageSelectionWidget({Key? key}) : super(key: key);

  @override
  _LanguageSelectionWidgetState createState() =>
      _LanguageSelectionWidgetState();
}

class _LanguageSelectionWidgetState extends State<LanguageSelectionWidget> {
  late LanguageSelectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanguageSelectionModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'iqkzporf' /* Select language */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
            child: InkWell(
              onTap: () async {
                FFAppState().update(() {
                  FFAppState().isEnglish = false;
                  FFAppState().selectedLanguageCode = 'fr';
                });
                setAppLanguage(context, FFAppState().selectedLanguageCode);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (FFAppState().isEnglish == true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Icon(
                        Icons.radio_button_off_rounded,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  if (FFAppState().isEnglish == false)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Icon(
                        Icons.radio_button_checked_rounded,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        't8c9txrm' /* French */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).black,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: InkWell(
              onTap: () async {
                FFAppState().update(() {
                  FFAppState().isEnglish = true;
                  FFAppState().selectedLanguageCode = 'en';
                });
                setAppLanguage(context, FFAppState().selectedLanguageCode);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (FFAppState().isEnglish == false)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Icon(
                        Icons.radio_button_off_rounded,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  if (FFAppState().isEnglish == true)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Icon(
                        Icons.radio_button_checked_rounded,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ph2q3vwm' /* English */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).black,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
