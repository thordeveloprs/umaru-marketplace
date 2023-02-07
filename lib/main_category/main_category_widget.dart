import '../components/appbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainCategoryWidget extends StatefulWidget {
  const MainCategoryWidget({
    Key? key,
    this.cetegoryId,
    this.cateName,
  }) : super(key: key);

  final int? cetegoryId;
  final String? cateName;

  @override
  _MainCategoryWidgetState createState() => _MainCategoryWidgetState();
}

class _MainCategoryWidgetState extends State<MainCategoryWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
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
              AppbarWidget(
                appTitle: widget.cateName,
                isShowBack: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 30, 15, 0),
                        child: Builder(
                          builder: (context) {
                            final mainList = FFAppState()
                                .categoryData
                                .where((e) =>
                                    getJsonField(
                                      e,
                                      r'''$.parent_id''',
                                    ) ==
                                    widget.cetegoryId)
                                .toList();
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 14.66,
                                childAspectRatio: 1,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: mainList.length,
                              itemBuilder: (context, mainListIndex) {
                                final mainListItem = mainList[mainListIndex];
                                return InkWell(
                                  onTap: () async {
                                    context.pushNamed(
                                      'categoryPage',
                                      queryParams: {
                                        'categoryID': serializeParam(
                                          getJsonField(
                                            mainListItem,
                                            r'''$.id''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'categoryName': serializeParam(
                                          getJsonField(
                                            mainListItem,
                                            r'''$.name''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 142.7,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.11),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 18.68, 20, 0),
                                          child: Image.network(
                                            functions.findProductImage(
                                                getJsonField(
                                                  mainListItem,
                                                  r'''$.custom_attributes''',
                                                )!,
                                                FFAppState().imageBaseUrl),
                                            width: 66.5,
                                            height: 69.7,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 14.49, 5, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  getJsonField(
                                                    mainListItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold,
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
