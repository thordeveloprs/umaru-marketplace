import '../backend/api_requests/api_calls.dart';
import '../components/appbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'category_page_model.dart';
export 'category_page_model.dart';

class CategoryPageWidget extends StatefulWidget {
  const CategoryPageWidget({
    Key? key,
    this.categoryID,
    this.categoryName,
  }) : super(key: key);

  final String? categoryID;
  final String? categoryName;

  @override
  _CategoryPageWidgetState createState() => _CategoryPageWidgetState();
}

class _CategoryPageWidgetState extends State<CategoryPageWidget> {
  late CategoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryPageModel());
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.appbarModel,
                updateCallback: () => setState(() {}),
                child: AppbarWidget(
                  appTitle: widget.categoryName,
                  isShowBack: true,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 21, 15, 21),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          context.pushNamed('search');
                        },
                        child: Container(
                          width: 259,
                          height: 54,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Color(0xFFEDF0F7),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        17, 0, 11.73, 0),
                                    child: Image.asset(
                                      'assets/images/Vector.png',
                                      width: 20.3,
                                      height: 21,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ua0ye29e' /* Search */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (false)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(23, 0, 19, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    context.pushNamed('Filter');
                                  },
                                  child: Image.asset(
                                    'assets/images/Filter.png',
                                    width: 18,
                                    height: 18,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      22, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed('All_Category');
                                    },
                                    child: Image.asset(
                                      'assets/images/Group.png',
                                      width: 18,
                                      height: 18,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (FFAppState().selectedLanguageCode == 'en')
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: UmaruGroup
                                  .productByCategoryIdAndProductIdCall
                                  .call(
                                id: widget.categoryID,
                                token: FFAppState().token,
                                searchTerm: 'category_id',
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                final gridViewProductByCategoryIdAndProductIdResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final productList = UmaruGroup
                                            .productByCategoryIdAndProductIdCall
                                            .getItems(
                                              gridViewProductByCategoryIdAndProductIdResponse
                                                  .jsonBody,
                                            )
                                            ?.where((e) =>
                                                ('${getJsonField(
                                                      e,
                                                      r'''$.status''',
                                                    ).toString()}' ==
                                                    '1') &&
                                                (functions.findWebsiteId(
                                                        getJsonField(
                                                      e,
                                                      r'''$.extension_attributes.website_ids''',
                                                    )!) ==
                                                    '1'))
                                            .toList()
                                            ?.map((e) => e)
                                            .toList()
                                            ?.toList() ??
                                        [];
                                    if (productList.isEmpty) {
                                      return Center(
                                        child: Image.asset(
                                          'assets/images/no_record_found.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                        ),
                                      );
                                    }
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 13,
                                        mainAxisSpacing: 13,
                                        childAspectRatio: 1,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: productList.length,
                                      itemBuilder: (context, productListIndex) {
                                        final productListItem =
                                            productList[productListIndex];
                                        return InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'Product_detailPage',
                                              queryParams: {
                                                'id': serializeParam(
                                                  getJsonField(
                                                    productListItem,
                                                    r'''$.id''',
                                                  ),
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 180,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.11),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(25, 9, 25, 0),
                                                  child: Image.network(
                                                    functions.findProductImage(
                                                        getJsonField(
                                                          productListItem,
                                                          r'''$.custom_attributes''',
                                                        )!,
                                                        FFAppState()
                                                            .imageBaseUrl),
                                                    width: 66.5,
                                                    height: 69.7,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(13, 10, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          getJsonField(
                                                            productListItem,
                                                            r'''$.name''',
                                                          ).toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(13, 0, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    2.5, 0),
                                                        child: Text(
                                                          getJsonField(
                                                            productListItem,
                                                            r'''$.price''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF050404),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(2.5,
                                                                    0, 0, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'wwb2ohk2' /* FCFA */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF050404),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      if (FFAppState().selectedLanguageCode == 'fr')
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: UmaruGroup
                                  .productByCategoryIdAndProductIdFrenchCall
                                  .call(
                                id: widget.categoryID,
                                token: FFAppState().token,
                                searchTerm: 'category_id',
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                final frenchGridViewProductByCategoryIdAndProductIdFrenchResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final productList = UmaruGroup
                                            .productByCategoryIdAndProductIdFrenchCall
                                            .frenchGetItems(
                                              frenchGridViewProductByCategoryIdAndProductIdFrenchResponse
                                                  .jsonBody,
                                            )
                                            ?.where((e) =>
                                                ('${getJsonField(
                                                      e,
                                                      r'''$.status''',
                                                    ).toString()}' ==
                                                    '1') &&
                                                (functions.findWebsiteId(
                                                        getJsonField(
                                                      e,
                                                      r'''$.extension_attributes.website_ids''',
                                                    )!) ==
                                                    '1'))
                                            .toList()
                                            ?.toList() ??
                                        [];
                                    if (productList.isEmpty) {
                                      return Center(
                                        child: Image.asset(
                                          'assets/images/no_record_found.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                        ),
                                      );
                                    }
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 13,
                                        mainAxisSpacing: 13,
                                        childAspectRatio: 1,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: productList.length,
                                      itemBuilder: (context, productListIndex) {
                                        final productListItem =
                                            productList[productListIndex];
                                        return InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'Product_detailPage',
                                              queryParams: {
                                                'id': serializeParam(
                                                  getJsonField(
                                                    productListItem,
                                                    r'''$.id''',
                                                  ),
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 180,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.11),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(25, 9, 25, 0),
                                                  child: Image.network(
                                                    functions.findProductImage(
                                                        getJsonField(
                                                          productListItem,
                                                          r'''$.custom_attributes''',
                                                        )!,
                                                        FFAppState()
                                                            .imageBaseUrl),
                                                    width: 66.5,
                                                    height: 69.7,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(13, 10, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          getJsonField(
                                                            productListItem,
                                                            r'''$.name''',
                                                          ).toString(),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF050404),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(13, 0, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    2.5, 0),
                                                        child: Text(
                                                          getJsonField(
                                                            productListItem,
                                                            r'''$.price''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF050404),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(2.5,
                                                                    0, 0, 0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'gyqwza9d' /* FCFA */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF050404),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
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
            ],
          ),
        ),
      ),
    );
  }
}
