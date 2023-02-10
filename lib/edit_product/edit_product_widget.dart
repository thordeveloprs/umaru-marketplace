import '../backend/api_requests/api_calls.dart';
import '../components/appbar_widget.dart';
import '../components/sucess_msg_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_product_model.dart';
export 'edit_product_model.dart';

class EditProductWidget extends StatefulWidget {
  const EditProductWidget({
    Key? key,
    this.id,
  }) : super(key: key);

  final int? id;

  @override
  _EditProductWidgetState createState() => _EditProductWidgetState();
}

class _EditProductWidgetState extends State<EditProductWidget> {
  late EditProductModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProductModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().selectedCountryId = 0;
        FFAppState().productStartDate = '';
        FFAppState().productEndDate = '';
        FFAppState().priceDateStart = '';
        FFAppState().priceDateEnd = '';
        FFAppState().selecetCategoryList = [];
        FFAppState().selectedCategoryIdList = [];
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.appbarModel,
                    updateCallback: () => setState(() {}),
                    child: AppbarWidget(
                      appTitle: 'Edit Product',
                      isShowBack: true,
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<ApiCallResponse>(
                      future: UmaruGroup.getProductAllDetailsForEditProductCall
                          .call(
                        vendorId: getJsonField(
                          FFAppState().userData,
                          r'''$.vendor_id''',
                        ).toString(),
                        productId: widget.id?.toString(),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final formGetProductAllDetailsForEditProductResponse =
                            snapshot.data!;
                        return Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 29, 15, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 7, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'menrklms' /* Product Name */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'mtuqqny5' /* * */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFEB5757),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Color(0xFFEBF0FF),
                                        width: 1,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller:
                                          _model.txtProductNameController ??=
                                              TextEditingController(
                                        text: functions.findEditProdutFromJson(
                                            UmaruGroup
                                                .getProductAllDetailsForEditProductCall
                                                .details(
                                                  formGetProductAllDetailsForEditProductResponse
                                                      .jsonBody,
                                                )!
                                                .toList(),
                                            'name'),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .black,
                                          ),
                                      keyboardType: TextInputType.name,
                                      validator: _model
                                          .txtProductNameControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 7, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2vg0rric' /* SKU */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'x7nlnghf' /* * */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFEB5757),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Color(0xFFEBF0FF),
                                        width: 1,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: _model.txtSkuController ??=
                                          TextEditingController(
                                        text: functions.findEditProdutFromJson(
                                            UmaruGroup
                                                .getProductAllDetailsForEditProductCall
                                                .details(
                                                  formGetProductAllDetailsForEditProductResponse
                                                      .jsonBody,
                                                )!
                                                .toList(),
                                            'sku'),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .black,
                                          ),
                                      validator: _model
                                          .txtSkuControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 7, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'm790oisr' /* Price */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '80fgzf1b' /* * */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFEB5757),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Color(0xFFEBF0FF),
                                        width: 1,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: _model.txtPriceController ??=
                                          TextEditingController(
                                        text: functions.findEditProdutFromJson(
                                            UmaruGroup
                                                .getProductAllDetailsForEditProductCall
                                                .details(
                                                  formGetProductAllDetailsForEditProductResponse
                                                      .jsonBody,
                                                )!
                                                .toList(),
                                            'price'),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .black,
                                          ),
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .txtPriceControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'awsuihr9' /* Set Special Price */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Switch(
                                            value: _model
                                                .switchISetSpecialPriceValue ??= functions
                                                        .findEditProdutFromJson(
                                                            UmaruGroup
                                                                .getProductAllDetailsForEditProductCall
                                                                .gestionavancedesprix(
                                                                  formGetProductAllDetailsForEditProductResponse
                                                                      .jsonBody,
                                                                )!
                                                                .toList(),
                                                            'special_price') !=
                                                    null &&
                                                functions.findEditProdutFromJson(
                                                        UmaruGroup.getProductAllDetailsForEditProductCall
                                                            .gestionavancedesprix(
                                                              formGetProductAllDetailsForEditProductResponse
                                                                  .jsonBody,
                                                            )!
                                                            .toList(),
                                                        'special_price') !=
                                                    '',
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                      .switchISetSpecialPriceValue =
                                                  newValue!);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (_model.switchISetSpecialPriceValue ??
                                      true)
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 25, 0, 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'amc2lap9' /* Special Price */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Color(0xFFEBF0FF),
                                              width: 1,
                                            ),
                                          ),
                                          child: TextFormField(
                                            controller: _model
                                                    .txSpecialPriceController ??=
                                                TextEditingController(
                                              text: functions
                                                  .findEditProdutFromJson(
                                                      UmaruGroup
                                                          .getProductAllDetailsForEditProductCall
                                                          .gestionavancedesprix(
                                                            formGetProductAllDetailsForEditProductResponse
                                                                .jsonBody,
                                                          )!
                                                          .toList(),
                                                      'special_price'),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .black,
                                                ),
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .txSpecialPriceControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 25, 0, 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'pjrrc9x7' /* Special price from */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: InkWell(
                                                onTap: () async {
                                                  final _datePicked1Date =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        getCurrentTimestamp,
                                                    firstDate:
                                                        getCurrentTimestamp,
                                                    lastDate: DateTime(2050),
                                                  );

                                                  if (_datePicked1Date !=
                                                      null) {
                                                    setState(() {
                                                      _model.datePicked1 =
                                                          DateTime(
                                                        _datePicked1Date.year,
                                                        _datePicked1Date.month,
                                                        _datePicked1Date.day,
                                                      );
                                                    });
                                                  }
                                                  setState(() {
                                                    FFAppState()
                                                            .priceDateStart =
                                                        dateTimeFormat(
                                                      'd/M/y',
                                                      _model.datePicked1,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    );
                                                  });
                                                },
                                                child: Container(
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                      color: Color(0xFFEBF0FF),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    FFAppState().priceDateStart !=
                                                                null &&
                                                            FFAppState()
                                                                    .priceDateStart !=
                                                                ''
                                                        ? FFAppState()
                                                            .priceDateStart
                                                        : functions
                                                            .findEditProdutFromJson(
                                                                UmaruGroup
                                                                    .getProductAllDetailsForEditProductCall
                                                                    .gestionavancedesprix(
                                                                      formGetProductAllDetailsForEditProductResponse
                                                                          .jsonBody,
                                                                    )!
                                                                    .toList(),
                                                                'special_from_date'),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .black,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 5, 0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'k4fgkzs3' /* To */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: InkWell(
                                                onTap: () async {
                                                  final _datePicked2Date =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        getCurrentTimestamp,
                                                    firstDate:
                                                        getCurrentTimestamp,
                                                    lastDate: DateTime(2050),
                                                  );

                                                  if (_datePicked2Date !=
                                                      null) {
                                                    setState(() {
                                                      _model.datePicked2 =
                                                          DateTime(
                                                        _datePicked2Date.year,
                                                        _datePicked2Date.month,
                                                        _datePicked2Date.day,
                                                      );
                                                    });
                                                  }
                                                  setState(() {
                                                    FFAppState().priceDateEnd =
                                                        dateTimeFormat(
                                                      'd/M/y',
                                                      _model.datePicked2,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    );
                                                  });
                                                },
                                                child: Container(
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                      color: Color(0xFFEBF0FF),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    FFAppState().priceDateEnd !=
                                                                null &&
                                                            FFAppState()
                                                                    .priceDateEnd !=
                                                                ''
                                                        ? FFAppState()
                                                            .priceDateEnd
                                                        : functions
                                                            .findEditProdutFromJson(
                                                                UmaruGroup
                                                                    .getProductAllDetailsForEditProductCall
                                                                    .gestionavancedesprix(
                                                                      formGetProductAllDetailsForEditProductResponse
                                                                          .jsonBody,
                                                                    )!
                                                                    .toList(),
                                                                'special_to_date'),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .black,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 7, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qx74i40q' /* Quantity */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'mli64bxk' /* * */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFEB5757),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Color(0xFFEBF0FF),
                                        width: 1,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller:
                                          _model.txQuantityController ??=
                                              TextEditingController(
                                        text: functions.findEditProdutFromJson(
                                            UmaruGroup
                                                .getProductAllDetailsForEditProductCall
                                                .details(
                                                  formGetProductAllDetailsForEditProductResponse
                                                      .jsonBody,
                                                )!
                                                .toList(),
                                            'qty'),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .black,
                                          ),
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .txQuantityControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'mfb9j1bq' /* Weight */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Color(0xFFEBF0FF),
                                        width: 1,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: _model.txWeightController ??=
                                          TextEditingController(
                                        text: functions.findEditProdutFromJson(
                                            UmaruGroup
                                                .getProductAllDetailsForEditProductCall
                                                .details(
                                                  formGetProductAllDetailsForEditProductResponse
                                                      .jsonBody,
                                                )!
                                                .toList(),
                                            'weight'),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .black,
                                          ),
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .txWeightControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'xbbzt1u5' /* Stock Status */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: FlutterFlowDropDown<String>(
                                      initialOption: _model
                                              .dropDownStockstaValue ??=
                                          functions.findEditProdutFromJson(
                                              UmaruGroup
                                                  .getProductAllDetailsForEditProductCall
                                                  .details(
                                                    formGetProductAllDetailsForEditProductResponse
                                                        .jsonBody,
                                                  )!
                                                  .toList(),
                                              'is_in_stock'),
                                      options: ['1', '0'],
                                      optionLabels: [
                                        FFLocalizations.of(context).getText(
                                          'fd8z6tju' /* In Stock  */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'fcu4dp1u' /* Exhausted */,
                                        )
                                      ],
                                      onChanged: (val) => setState(() =>
                                          _model.dropDownStockstaValue = val),
                                      width: double.infinity,
                                      height: 48,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                          ),
                                      fillColor: Colors.white,
                                      elevation: 2,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0,
                                      borderRadius: 0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'di06alia' /* Set the Product as a New from */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: InkWell(
                                          onTap: () async {
                                            final _datePicked3Date =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: getCurrentTimestamp,
                                              firstDate: getCurrentTimestamp,
                                              lastDate: DateTime(2050),
                                            );

                                            if (_datePicked3Date != null) {
                                              setState(() {
                                                _model.datePicked3 = DateTime(
                                                  _datePicked3Date.year,
                                                  _datePicked3Date.month,
                                                  _datePicked3Date.day,
                                                );
                                              });
                                            }
                                            setState(() {
                                              FFAppState().productStartDate =
                                                  dateTimeFormat(
                                                'd/M/y',
                                                _model.datePicked3,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              );
                                            });
                                          },
                                          child: Container(
                                            height: 48,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Color(0xFFEBF0FF),
                                                width: 1,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              FFAppState().productStartDate !=
                                                          null &&
                                                      FFAppState()
                                                              .productStartDate !=
                                                          ''
                                                  ? FFAppState()
                                                      .productStartDate
                                                  : functions
                                                      .findEditProdutFromJson(
                                                          UmaruGroup
                                                              .getProductAllDetailsForEditProductCall
                                                              .details(
                                                                formGetProductAllDetailsForEditProductResponse
                                                                    .jsonBody,
                                                              )!
                                                              .toList(),
                                                          'news_from_date'),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'p60y16md' /* To */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: InkWell(
                                          onTap: () async {
                                            final _datePicked4Date =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: getCurrentTimestamp,
                                              firstDate: getCurrentTimestamp,
                                              lastDate: DateTime(2050),
                                            );

                                            if (_datePicked4Date != null) {
                                              setState(() {
                                                _model.datePicked4 = DateTime(
                                                  _datePicked4Date.year,
                                                  _datePicked4Date.month,
                                                  _datePicked4Date.day,
                                                );
                                              });
                                            }
                                            setState(() {
                                              FFAppState().productEndDate =
                                                  dateTimeFormat(
                                                'd/M/y',
                                                _model.datePicked4,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              );
                                            });
                                          },
                                          child: Container(
                                            height: 48,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: Color(0xFFEBF0FF),
                                                width: 1,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              FFAppState().productEndDate !=
                                                          null &&
                                                      FFAppState()
                                                              .productEndDate !=
                                                          ''
                                                  ? FFAppState().productEndDate
                                                  : functions
                                                      .findEditProdutFromJson(
                                                          UmaruGroup
                                                              .getProductAllDetailsForEditProductCall
                                                              .details(
                                                                formGetProductAllDetailsForEditProductResponse
                                                                    .jsonBody,
                                                              )!
                                                              .toList(),
                                                          'news_to_date'),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'ppi9gkv5' /* Is Featured  */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Switch(
                                            value: _model
                                                .switchIsFeatureValue ??= functions
                                                    .findEditProdutFromJson(
                                                        UmaruGroup
                                                            .getProductAllDetailsForEditProductCall
                                                            .details(
                                                              formGetProductAllDetailsForEditProductResponse
                                                                  .jsonBody,
                                                            )!
                                                            .toList(),
                                                        'sw_featured') ==
                                                '1',
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  _model.switchIsFeatureValue =
                                                      newValue!);
                                            },
                                          ),
                                          Text(
                                            _model.switchIsFeatureValue!
                                                ? 'Oui'
                                                : 'Non',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 7, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'fyts3w4t' /* Country */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '96h5uvbg' /* * */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFEB5757),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: FlutterFlowDropDown<String>(
                                      initialOption: _model
                                          .dropDownCountryValue ??= functions
                                                      .findEditProdutFromJson(
                                                          UmaruGroup
                                                              .getProductAllDetailsForEditProductCall
                                                              .details(
                                                                formGetProductAllDetailsForEditProductResponse
                                                                    .jsonBody,
                                                              )!
                                                              .toList(),
                                                          'country') ==
                                                  null ||
                                              functions.findEditProdutFromJson(
                                                      UmaruGroup
                                                          .getProductAllDetailsForEditProductCall
                                                          .details(
                                                            formGetProductAllDetailsForEditProductResponse
                                                                .jsonBody,
                                                          )!
                                                          .toList(),
                                                      'country') ==
                                                  ''
                                          ? '4'
                                          : functions.findEditProdutFromJson(
                                              UmaruGroup
                                                  .getProductAllDetailsForEditProductCall
                                                  .details(
                                                    formGetProductAllDetailsForEditProductResponse
                                                        .jsonBody,
                                                  )!
                                                  .toList(),
                                              'country'),
                                      options: ['4', '5', '6'],
                                      optionLabels: [
                                        FFLocalizations.of(context).getText(
                                          'zaqb2msj' /* Mali */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '7v0bn8cm' /* Senegal */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'zyn8e18i' /* Cote d'ivoire */,
                                        )
                                      ],
                                      onChanged: (val) async {
                                        setState(() =>
                                            _model.dropDownCountryValue = val);
                                        if (_model.dropDownCountryValue ==
                                            'Mali') {
                                          setState(() {
                                            FFAppState().selectedCountryId = 4;
                                          });
                                        } else {
                                          if (_model.dropDownCountryValue ==
                                              'Senegal') {
                                            setState(() {
                                              FFAppState().selectedCountryId =
                                                  5;
                                            });
                                          } else {
                                            if (_model.dropDownCountryValue ==
                                                'Cote d\'ivoire') {
                                              setState(() {
                                                FFAppState().selectedCountryId =
                                                    6;
                                              });
                                            }
                                          }
                                        }

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              FFAppState()
                                                  .selectedCountryId
                                                  .toString(),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0x00000000),
                                          ),
                                        );
                                      },
                                      width: double.infinity,
                                      height: 48,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        't225ejyg' /* Please select... */,
                                      ),
                                      fillColor: Colors.white,
                                      elevation: 2,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0,
                                      borderRadius: 0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 7, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '3ymbbsia' /* Category */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '3hu4o4ec' /* * */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFEB5757),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  FlutterFlowDropDown<String>(
                                    options: functions
                                        .createCategoryList(
                                            FFAppState().categoryData.toList(),
                                            FFAppState().findShopCategoryId)
                                        .toList(),
                                    onChanged: (val) async {
                                      setState(() =>
                                          _model.dropDownCategoryValue = val);
                                      _model.selectedCategory = await actions
                                          .createSubCategoryOnCategorySelect(
                                        _model.dropDownCategoryValue!,
                                        FFAppState().categoryData.toList(),
                                      );
                                      if (!FFAppState()
                                          .selecetCategoryList
                                          .contains(
                                              _model.dropDownCountryValue)) {
                                        setState(() {
                                          FFAppState().addToSelecetCategoryList(
                                              _model.dropDownCategoryValue!);
                                          FFAppState().addToSelectedCategoryIdList(
                                              functions.getSelectedCategoryId(
                                                  _model
                                                      .dropDownCategoryValue!));
                                        });
                                      }

                                      setState(() {});
                                    },
                                    width: double.infinity,
                                    height: 48,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '8z9rp7ns' /* Please select... */,
                                    ),
                                    fillColor: Colors.white,
                                    elevation: 2,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0,
                                    borderRadius: 0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12, 4, 12, 4),
                                    hidesUnderline: true,
                                  ),
                                  if (_model.selectedCategory?.length != null)
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 25, 0, 12),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'm2xeb55k' /* Sub Category */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        FlutterFlowDropDown<String>(
                                          options:
                                              _model.selectedCategory!.toList(),
                                          onChanged: (val) async {
                                            setState(() => _model
                                                    .dropDownsubcategoryValue =
                                                val);
                                            _model.subCategoryId =
                                                await actions.getSubCategoryId(
                                              _model.dropDownsubcategoryValue!,
                                            );
                                            if (!FFAppState()
                                                .selecetCategoryList
                                                .contains(_model
                                                    .dropDownsubcategoryValue)) {
                                              setState(() {
                                                FFAppState()
                                                    .addToSelecetCategoryList(_model
                                                        .dropDownsubcategoryValue!);
                                                FFAppState()
                                                    .addToSelectedCategoryIdList(
                                                        functions
                                                            .getSelectedCategoryId(
                                                                _model
                                                                    .dropDownsubcategoryValue!));
                                              });
                                            }

                                            setState(() {});
                                          },
                                          width: double.infinity,
                                          height: 48,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.black,
                                                  ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '9i9d8l8h' /* Please select... */,
                                          ),
                                          fillColor: Colors.white,
                                          elevation: 2,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0,
                                          borderRadius: 0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          hidesUnderline: true,
                                        ),
                                      ],
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Builder(
                                        builder: (context) {
                                          final selectedCategoryList =
                                              FFAppState()
                                                  .selecetCategoryList
                                                  .map((e) => e)
                                                  .toList();
                                          return Wrap(
                                            spacing: 0,
                                            runSpacing: 0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: List.generate(
                                                selectedCategoryList.length,
                                                (selectedCategoryListIndex) {
                                              final selectedCategoryListItem =
                                                  selectedCategoryList[
                                                      selectedCategoryListIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 8, 8),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 8, 8, 8),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          selectedCategoryListItem,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      0, 0, 0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              setState(() {
                                                                FFAppState()
                                                                    .removeFromSelecetCategoryList(
                                                                        selectedCategoryListItem);
                                                                FFAppState().removeFromSelectedCategoryIdList(
                                                                    functions
                                                                        .getSelectedCategoryId(
                                                                            selectedCategoryListItem));
                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons.close,
                                                              color:
                                                                  Colors.white,
                                                              size: 24,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'vwgf8cd9' /* Image Upload */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        imageQuality: 44,
                                        allowPhoto: true,
                                        backgroundColor: Colors.white,
                                        textColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isMediaUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                  ))
                                              .toList();
                                        } finally {
                                          _model.isMediaUploading = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile =
                                                selectedUploadedFiles.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 98,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Color(0xFF1C86C2),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'vq98v1dx' /* Select Photos */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 22, 0, 0),
                                      child: Wrap(
                                        spacing: 0,
                                        runSpacing: 0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            width: 112,
                                            height: 68,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: 111.5,
                                                  height: 67,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(28, 5.38,
                                                                28, 5.77),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/960/600',
                                                      width: 55.9,
                                                      height: 55.9,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.16, -1.42),
                                                  child: Image.asset(
                                                    'assets/images/ri_close-circle-fill.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 7, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'w3q1760b' /* Short Description */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'gxwmyljo' /* * */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFEB5757),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Color(0xFFEBF0FF),
                                        width: 1,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: _model
                                              .shortdescriptiontxtController ??=
                                          TextEditingController(
                                        text: functions.findEditProdutFromJson(
                                            UmaruGroup
                                                .getProductAllDetailsForEditProductCall
                                                .contenu(
                                                  formGetProductAllDetailsForEditProductResponse
                                                      .jsonBody,
                                                )!
                                                .toList(),
                                            'short_description'),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .black,
                                          ),
                                      maxLines: null,
                                      validator: _model
                                          .shortdescriptiontxtControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 7, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'iehjjfex' /* Description */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '1xdnh6bj' /* * */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFEB5757),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Color(0xFFEBF0FF),
                                        width: 1,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller:
                                          _model.descriptiontxtController ??=
                                              TextEditingController(
                                        text: functions.findEditProdutFromJson(
                                            UmaruGroup
                                                .getProductAllDetailsForEditProductCall
                                                .contenu(
                                                  formGetProductAllDetailsForEditProductResponse
                                                      .jsonBody,
                                                )!
                                                .toList(),
                                            'description'),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .black,
                                          ),
                                      maxLines: null,
                                      validator: _model
                                          .descriptiontxtControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'sle95kp0' /* Meta Title */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Color(0xFFEBF0FF),
                                        width: 1,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller:
                                          _model.txtMetaTitleController ??=
                                              TextEditingController(
                                        text: functions.findEditProdutFromJson(
                                            UmaruGroup
                                                .getProductAllDetailsForEditProductCall
                                                .optimisationpourlesmoteursderecherche(
                                                  formGetProductAllDetailsForEditProductResponse
                                                      .jsonBody,
                                                )!
                                                .toList(),
                                            'meta_title'),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .black,
                                          ),
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .txtMetaTitleControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '8ftb2hgu' /* Meta Description */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Color(0xFFEBF0FF),
                                        width: 1,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller:
                                          _model.metadesTxtController ??=
                                              TextEditingController(
                                        text: functions.findEditProdutFromJson(
                                            UmaruGroup
                                                .getProductAllDetailsForEditProductCall
                                                .optimisationpourlesmoteursderecherche(
                                                  formGetProductAllDetailsForEditProductResponse
                                                      .jsonBody,
                                                )!
                                                .toList(),
                                            'meta_description'),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .black,
                                          ),
                                      maxLines: null,
                                      validator: _model
                                          .metadesTxtControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 25, 0, 15),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '8v228q18' /* Confirm */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 54,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              if (FFAppState().isConfirm == true)
                wrapWithModel(
                  model: _model.sucessMsgModel,
                  updateCallback: () => setState(() {}),
                  child: SucessMsgWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
