import '../components/language_selection_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_accounts_model.dart';
export 'my_accounts_model.dart';

class MyAccountsWidget extends StatefulWidget {
  const MyAccountsWidget({Key? key}) : super(key: key);

  @override
  _MyAccountsWidgetState createState() => _MyAccountsWidgetState();
}

class _MyAccountsWidgetState extends State<MyAccountsWidget> {
  late MyAccountsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyAccountsModel());
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 19, 0),
                        child: Image.asset(
                          'assets/images/User.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (FFAppState().isLogin == true)
                        Text(
                          getJsonField(
                            FFAppState().userData,
                            r'''$.vendor_name''',
                          ).toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      if (FFAppState().isLogin == false)
                        Text(
                          FFLocalizations.of(context).getText(
                            'h1ahj7v6' /* User */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (FFAppState().isLogin == true)
                            InkWell(
                              onTap: () async {
                                context.pushNamed('EditProfile');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'pldvdyz5' /* Profile */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Color(0xFFC4C4C4),
                                  ),
                                ],
                              ),
                            ),
                          if (FFAppState().isLogin == true)
                            InkWell(
                              onTap: () async {
                                if (getJsonField(
                                      FFAppState().subscriptionDetail,
                                      r'''$.running_plans''',
                                    ) !=
                                    null) {
                                  context.pushNamed(
                                    'ManageProducts',
                                    queryParams: {
                                      'isCommingFromLogin': serializeParam(
                                        false,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  context.pushNamed(
                                    'BuyMembershipPage',
                                    queryParams: {
                                      'commingFromHome': serializeParam(
                                        false,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
                                }
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '4uwb1xdx' /* Manage Product */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Color(0xFFC4C4C4),
                                  ),
                                ],
                              ),
                            ),
                          InkWell(
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: LanguageSelectionWidget(),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 24, 0, 23),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'fqdv5hs8' /* Language */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 17,
                                              ),
                                        ),
                                        Text(
                                          FFAppState().selectedLanguageCode ==
                                                  'en'
                                              ? 'English'
                                              : 'French',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Color(0xFFC4C4C4),
                                ),
                              ],
                            ),
                          ),
                          if (false)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 23),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5vc88ei9' /* Currency */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 17,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 7.91, 0),
                                              child: Image.asset(
                                                'assets/images/image_62.png',
                                                width: 22.2,
                                                height: 15,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'lk525ulh' /* XOF CFA */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Color(0xFFC4C4C4),
                                ),
                              ],
                            ),
                          if (false)
                            InkWell(
                              onTap: () async {
                                context.pushNamed(
                                  'webview',
                                  queryParams: {
                                    'pagename': serializeParam(
                                      'FAQ',
                                      ParamType.String,
                                    ),
                                    'pageURL': serializeParam(
                                      FFAppState().selectedLanguageCode == 'en'
                                          ? 'https://staging.umarumart.com/apppage/en/faq.php'
                                          : 'https://staging.umarumart.com/apppage/fr/faq.php',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'labm5b1q' /* FAQs */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Color(0xFFC4C4C4),
                                  ),
                                ],
                              ),
                            ),
                          InkWell(
                            onTap: () async {
                              context.pushNamed(
                                'webview',
                                queryParams: {
                                  'pagename': serializeParam(
                                    'FAQ',
                                    ParamType.String,
                                  ),
                                  'pageURL': serializeParam(
                                    FFAppState().selectedLanguageCode == 'en'
                                        ? 'https://staging.umarumart.com/apppage/en/contact.php'
                                        : 'https://staging.umarumart.com/apppage/fr/contact.php',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 20),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'kzuiblqv' /* Contact Us */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 17,
                                              ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Color(0xFFC4C4C4),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              context.pushNamed(
                                'webview',
                                queryParams: {
                                  'pagename': serializeParam(
                                    'FAQ',
                                    ParamType.String,
                                  ),
                                  'pageURL': serializeParam(
                                    FFAppState().selectedLanguageCode == 'en'
                                        ? 'https://staging.umarumart.com/apppage/en/tnc.php'
                                        : 'https://staging.umarumart.com/apppage/fr/tnc.php',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 20),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '6kc9ijah' /* Terms & Conditions */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 17,
                                              ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Color(0xFFC4C4C4),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              context.pushNamed(
                                'webview',
                                queryParams: {
                                  'pagename': serializeParam(
                                    'FAQ',
                                    ParamType.String,
                                  ),
                                  'pageURL': serializeParam(
                                    FFAppState().selectedLanguageCode == 'en'
                                        ? 'https://staging.umarumart.com/apppage/en/privacy.php'
                                        : 'https://staging.umarumart.com/apppage/fr/privacy.php',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 20),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'du1ib3ff' /* Privacy Policy */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 17,
                                              ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Color(0xFFC4C4C4),
                                ),
                              ],
                            ),
                          ),
                          if (FFAppState().isLogin == true)
                            InkWell(
                              onTap: () async {
                                FFAppState().update(() {
                                  FFAppState().isLogin = false;
                                  FFAppState().userData = null;
                                });

                                context.pushNamed('Home');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 21),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'h7it2kdi' /* Log Out */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Color(0xFFC4C4C4),
                                  ),
                                ],
                              ),
                            ),
                          if (FFAppState().isLogin == false)
                            InkWell(
                              onTap: () async {
                                context.pushNamed('LogInPage');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 21),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '40ndwqug' /* Seller Login */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 17,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Color(0xFFC4C4C4),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30.14),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'e5nh1b6y' /* Connect With us */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF828282),
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 12.36, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 15, 0),
                                      child: Image.asset(
                                        'assets/images/fb.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/images/instagram_(3)_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
