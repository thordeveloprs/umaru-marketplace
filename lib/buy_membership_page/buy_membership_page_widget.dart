import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'buy_membership_page_model.dart';
export 'buy_membership_page_model.dart';

class BuyMembershipPageWidget extends StatefulWidget {
  const BuyMembershipPageWidget({
    Key? key,
    this.commingFromHome,
  }) : super(key: key);

  final bool? commingFromHome;

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
      setState(() {
        _model.showLoading = false;
      });
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
          child: Stack(
            children: [
              if (!_model.showLoading)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 20),
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 22,
                                ),
                          ),
                        ],
                      ),
                    ),
                    if (_model.subscriptionResult != null)
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 15, 0),
                                  child: Builder(
                                    builder: (context) {
                                      final membership = getJsonField(
                                        (_model.subscriptionResult?.jsonBody ??
                                            ''),
                                        r'''$..membership_plans''',
                                      ).toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: membership.length,
                                        itemBuilder:
                                            (context, membershipIndex) {
                                          final membershipItem =
                                              membership[membershipIndex];
                                          return Container(
                                            width: double.infinity,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
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
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              getJsonField(
                                                                membershipItem,
                                                                r'''$.membership_name''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 10,
                                                                    0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          5,
                                                                          0),
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 5, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        _model.addToCartResult =
                                                            await UmaruGroup
                                                                .subscriptionAddToCartCall
                                                                .call(
                                                          venderId:
                                                              getJsonField(
                                                            FFAppState()
                                                                .userData,
                                                            r'''$.vendor_id''',
                                                          ).toString(),
                                                          membershipId:
                                                              getJsonField(
                                                            membershipItem,
                                                            r'''$.membership_id''',
                                                          ).toString(),
                                                        );
                                                        if ((_model
                                                                .addToCartResult
                                                                ?.succeeded ??
                                                            true)) {
                                                          if (getJsonField(
                                                            (_model.addToCartResult
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$[0].data.status''',
                                                          )) {
                                                            context.pushNamed(
                                                              'paymentWebView',
                                                              queryParams: {
                                                                'url':
                                                                    serializeParam(
                                                                  'https://staging.umarumart.com/csuser/redirect/?cid=${getJsonField(
                                                                    (_model.addToCartResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$[0].data.customer_id''',
                                                                  ).toString()}&vid=${getJsonField(
                                                                    FFAppState()
                                                                        .userData,
                                                                    r'''$.vendor_id''',
                                                                  ).toString()}',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  getJsonField(
                                                                    (_model.addToCartResult
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$[0].data.message''',
                                                                  ).toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .black,
                                                              ),
                                                            );
                                                          }
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                (_model.addToCartResult
                                                                            ?.jsonBody ??
                                                                        '')
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .black,
                                                            ),
                                                          );
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'zz2z69w8' /* Buy Now */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 40,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
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
                            ],
                          ),
                        ),
                      ),
                    if (_model.subscriptionResult != null)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (widget.commingFromHome ?? true)
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
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
              if (_model.showLoading)
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
                  child: custom_widgets.HomeCustomProgressWidget(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 1,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
