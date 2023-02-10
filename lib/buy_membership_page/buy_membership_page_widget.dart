import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'buy_membership_page_model.dart';
export 'buy_membership_page_model.dart';

class BuyMembershipPageWidget extends StatefulWidget {
  const BuyMembershipPageWidget({Key? key}) : super(key: key);

  @override
  _BuyMembershipPageWidgetState createState() =>
      _BuyMembershipPageWidgetState();
}

class _BuyMembershipPageWidgetState extends State<BuyMembershipPageWidget> {
  late BuyMembershipPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuyMembershipPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.subscriptionResult =
          await UmaruGroup.getSubscriptionDetailsCall.call(
        venderId: getJsonField(
          FFAppState().userData,
          r'''$.vendor_id''',
        ).toString().toString(),
      );
      if ((_model.subscriptionResult?.succeeded ?? true)) {
        setState(() {
          FFAppState().subscriptionDetail = getJsonField(
            (_model.subscriptionResult?.jsonBody ?? ''),
            r'''$..membership_plans''',
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 123, 15, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'f262efla' /* Membership Details */,
                      ),
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryColor,
                            fontSize: 22,
                          ),
                    ),
                  ],
                ),
              ),
              if (_model.subscriptionResult != null)
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                    child: Builder(
                      builder: (context) {
                        final membership = getJsonField(
                          (_model.subscriptionResult?.jsonBody ?? ''),
                          r'''$..membership_plans''',
                        ).toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: membership.length,
                          itemBuilder: (context, membershipIndex) {
                            final membershipItem = membership[membershipIndex];
                            return Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 10, 10),
                                      child: Image.network(
                                        getJsonField(
                                          membershipItem,
                                          r'''$.membership_image''',
                                        ),
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                getJsonField(
                                                  membershipItem,
                                                  r'''$.membership_name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 5, 0),
                                                child: Text(
                                                  getJsonField(
                                                    membershipItem,
                                                    r'''$.price''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 5, 0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'uyracpdl' /* Subscribe */,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('Home');
                      },
                      text: FFLocalizations.of(context).getText(
                        'bc5c9vv1' /* Skip */,
                      ),
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
