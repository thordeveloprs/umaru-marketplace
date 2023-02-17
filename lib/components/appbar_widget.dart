import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appbar_model.dart';
export 'appbar_model.dart';

class AppbarWidget extends StatefulWidget {
  const AppbarWidget({
    Key? key,
    this.appTitle,
    this.isShowBack,
  }) : super(key: key);

  final String? appTitle;
  final bool? isShowBack;

  @override
  _AppbarWidgetState createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  late AppbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppbarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (widget.isShowBack ?? true)
          Expanded(
            child: InkWell(
              onTap: () async {
                context.pop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(9, 0, 5, 0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFFC7C7CC),
                      size: 24,
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '0un09esu' /* Back */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFFC7C7CC),
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
          ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  widget.appTitle!,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [],
          ),
        ),
      ],
    );
  }
}
