import '../backend/api_requests/api_calls.dart';
import '../components/appbar_widget.dart';
import '../components/sucess_msg_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_product_model.dart';
export 'add_product_model.dart';

class AddProductWidget extends StatefulWidget {
  const AddProductWidget({Key? key}) : super(key: key);

  @override
  _AddProductWidgetState createState() => _AddProductWidgetState();
}

class _AddProductWidgetState extends State<AddProductWidget> {
  late AddProductModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddProductModel());

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

    _model.txtProductNameController ??= TextEditingController();
    _model.txtSkuController ??= TextEditingController();
    _model.txtPriceController ??= TextEditingController();
    _model.txSpecialPriceController ??= TextEditingController();
    _model.txQuantityController ??= TextEditingController();
    _model.txWeightController ??= TextEditingController();
    _model.shortdescriptiontxtController ??= TextEditingController();
    _model.descriptiontxtController ??= TextEditingController();
    _model.txtMetaTitleController ??= TextEditingController();
    _model.metadesTxtController ??= TextEditingController();
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
                      appTitle: 'Add Product',
                      isShowBack: true,
                    ),
                  ),
                  Expanded(
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 29, 15, 0),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 7, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '51t5z7ao' /* Product Name */,
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
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'hgsodskl' /* * */,
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
                                  controller: _model.txtProductNameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).black,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 7, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '2kqyqkli' /* SKU */,
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
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'od9e4svd' /* * */,
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
                                  controller: _model.txtSkuController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).black,
                                      ),
                                  validator: _model.txtSkuControllerValidator
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 7, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'jq9j560t' /* Price */,
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
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '4drw1ybi' /* * */,
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
                                  controller: _model.txtPriceController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).black,
                                      ),
                                  keyboardType: TextInputType.number,
                                  validator: _model.txtPriceControllerValidator
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'gt3zd2as' /* Set Special Price */,
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
                                                .switchISetSpecialPriceValue ??=
                                            false,
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
                              if (_model.switchISetSpecialPriceValue ?? true)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
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
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1s67b7gm' /* Special Price */,
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
                                            _model.txSpecialPriceController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'hmf6t5s6' /* Special price from */,
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
                                                firstDate: getCurrentTimestamp,
                                                lastDate: DateTime(2050),
                                              );

                                              if (_datePicked1Date != null) {
                                                setState(() {
                                                  _model.datePicked1 = DateTime(
                                                    _datePicked1Date.year,
                                                    _datePicked1Date.month,
                                                    _datePicked1Date.day,
                                                  );
                                                });
                                              }
                                              setState(() {
                                                FFAppState().priceDateStart =
                                                    dateTimeFormat(
                                                  'd/M/y',
                                                  _model.datePicked1,
                                                  locale: FFLocalizations.of(
                                                          context)
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
                                                FFAppState().priceDateStart,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 5, 0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '9yhjpwb8' /* To */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                                firstDate: getCurrentTimestamp,
                                                lastDate: DateTime(2050),
                                              );

                                              if (_datePicked2Date != null) {
                                                setState(() {
                                                  _model.datePicked2 = DateTime(
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
                                                  locale: FFLocalizations.of(
                                                          context)
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
                                                FFAppState().priceDateEnd,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 7, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '48bqkyu6' /* Quantity */,
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
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '0u8mfm93' /* * */,
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
                                  controller: _model.txQuantityController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).black,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'ln1tvq9n' /* Weight */,
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
                                  controller: _model.txWeightController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).black,
                                      ),
                                  keyboardType: TextInputType.number,
                                  validator: _model.txWeightControllerValidator
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'fedck62x' /* Stock Status */,
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
                                child: FlutterFlowDropDown<int>(
                                  initialOption:
                                      _model.dropDownStockstaValue ??= 1,
                                  options: [1, 0],
                                  optionLabels: [
                                    FFLocalizations.of(context).getText(
                                      'j8751bfb' /* In Stock  */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'xik083mw' /* Exhausted */,
                                    )
                                  ],
                                  onChanged: (val) => setState(
                                      () => _model.dropDownStockstaValue = val),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '7xo2l30t' /* Set the Product as a New from */,
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
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          );
                                        });
                                      },
                                      child: Container(
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
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Text(
                                          FFAppState().productStartDate,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                        'zzsucxyz' /* To */,
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
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          );
                                        });
                                      },
                                      child: Container(
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
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Text(
                                          FFAppState().productEndDate,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'xlh6u3rq' /* Is Featured  */,
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
                                        value: _model.switchIsFeatureValue ??=
                                            false,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 7, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'h2d0wn47' /* Country */,
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
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'hdze4isj' /* * */,
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
                                  options: FFAppState().listCountry.toList(),
                                  onChanged: (val) async {
                                    setState(() =>
                                        _model.dropDownCountryValue = val);
                                    if (_model.dropDownCountryValue == 'Mali') {
                                      setState(() {
                                        FFAppState().selectedCountryId = 4;
                                      });
                                    } else {
                                      if (_model.dropDownCountryValue ==
                                          'Senegal') {
                                        setState(() {
                                          FFAppState().selectedCountryId = 5;
                                        });
                                      } else {
                                        if (_model.dropDownCountryValue ==
                                            'Cote d\'ivoire') {
                                          setState(() {
                                            FFAppState().selectedCountryId = 6;
                                          });
                                        }
                                      }
                                    }

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          FFAppState()
                                              .selectedCountryId
                                              .toString(),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
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
                                  hintText: FFLocalizations.of(context).getText(
                                    'j999msk4' /* Please select... */,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 7, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ztcmmad9' /* Category */,
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
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'cy0qce3x' /* * */,
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
                                  setState(
                                      () => _model.dropDownCategoryValue = val);
                                  _model.selectedCategory = await actions
                                      .createSubCategoryOnCategorySelect(
                                    _model.dropDownCategoryValue!,
                                    FFAppState().categoryData.toList(),
                                  );
                                  if (!FFAppState()
                                      .selecetCategoryList
                                      .contains(_model.dropDownCountryValue)) {
                                    setState(() {
                                      FFAppState().addToSelecetCategoryList(
                                          _model.dropDownCategoryValue!);
                                      FFAppState().addToSelectedCategoryIdList(
                                          functions
                                              .getSelectedCategoryId(
                                                  _model.dropDownCategoryValue!)
                                              .toString());
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
                                hintText: FFLocalizations.of(context).getText(
                                  'b1r8noxx' /* Please select... */,
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
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'nc7d8gdm' /* Sub Category */,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    FlutterFlowDropDown<String>(
                                      options:
                                          _model.selectedCategory!.toList(),
                                      onChanged: (val) async {
                                        setState(() => _model
                                            .dropDownsubcategoryValue = val);
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
                                            FFAppState().addToSelectedCategoryIdList(
                                                functions
                                                    .getSelectedCategoryId(_model
                                                        .dropDownsubcategoryValue!)
                                                    .toString());
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
                                        '8zummp9n' /* Please select... */,
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
                                  ],
                                ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Builder(
                                    builder: (context) {
                                      final selectedCategoryList = FFAppState()
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 8),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 8, 8, 8),
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
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 0, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          setState(() {
                                                            FFAppState()
                                                                .removeFromSelecetCategoryList(
                                                                    selectedCategoryListItem);
                                                            FFAppState().removeFromSelectedCategoryIdList(functions
                                                                .getSelectedCategoryId(
                                                                    selectedCategoryListItem)
                                                                .toString());
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.close,
                                                          color: Colors.white,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          's548nlpk' /* Image Upload */,
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
                                    setState(
                                        () => _model.isMediaUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'myi910on' /* Select Photos */,
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: custom_widgets.AssetsImageViewList(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    listImage: FFAppState()
                                        .imageListForAddProduct
                                        .toList(),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 7, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'wlkswa8h' /* Short Description */,
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
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'vxgfjtg2' /* * */,
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
                                  controller:
                                      _model.shortdescriptiontxtController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).black,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 7, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'drupwz7u' /* Description */,
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
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '7qjvlohe' /* * */,
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
                                  controller: _model.descriptiontxtController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).black,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'nse4uqkl' /* Meta Title */,
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
                                  controller: _model.txtMetaTitleController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).black,
                                      ),
                                  maxLines: null,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'hbi0gd7x' /* Meta Description */,
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
                                  controller: _model.metadesTxtController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).black,
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
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.dropDownCountryValue == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Country Is Required',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Colors.black,
                                        ),
                                      );
                                      return;
                                    }
                                    if (_model.dropDownCategoryValue == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Category is Required',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Colors.black,
                                        ),
                                      );
                                      return;
                                    }
                                    _model.createProductDetails =
                                        await UmaruGroup.createProductCall.call(
                                      vendorId: getJsonField(
                                        FFAppState().userData,
                                        r'''$.vendor_id''',
                                      ).toString(),
                                      hashkey: getJsonField(
                                        FFAppState().userData,
                                        r'''$.hashkey''',
                                      ).toString(),
                                      name:
                                          _model.txtProductNameController.text,
                                      sku: _model.txtSkuController.text,
                                      price: double.tryParse(
                                          _model.txtPriceController.text),
                                      qty: int.tryParse(
                                          _model.txQuantityController.text),
                                      images: _model.uploadedLocalFile,
                                      description:
                                          _model.descriptiontxtController.text,
                                      isInStock: _model.dropDownStockstaValue,
                                      weight: double.tryParse(
                                          _model.txWeightController.text),
                                      metaTitle:
                                          _model.txtMetaTitleController.text,
                                      specialPrice: double.tryParse(
                                          _model.txSpecialPriceController.text),
                                      metaDescription:
                                          _model.metadesTxtController.text,
                                      shortDescription: _model
                                          .shortdescriptiontxtController.text,
                                      specialToDate: dateTimeFormat(
                                        'd/M/y',
                                        _model.datePicked2,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      newsFromDate: dateTimeFormat(
                                        'd/M/y',
                                        _model.datePicked3,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      newsToDate: dateTimeFormat(
                                        'd/M/y',
                                        _model.datePicked4,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      swFeatured:
                                          _model.switchIsFeatureValue! ? 1 : 0,
                                      categoryList:
                                          FFAppState().selectedCategoryIdList,
                                      specialFromDate: dateTimeFormat(
                                        'd/M/y',
                                        _model.datePicked1,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      country: FFAppState().selectedCountryId,
                                    );
                                    if (getJsonField(
                                      (_model.createProductDetails?.jsonBody ??
                                          ''),
                                      r'''$.data.success''',
                                    )) {
                                      setState(() {
                                        _model.showLoading = true;
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            getJsonField(
                                              (_model.createProductDetails
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.data.message''',
                                            ).toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Colors.black,
                                        ),
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'htvqm6j1' /* Confirm */,
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
                                          color: FlutterFlowTheme.of(context)
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
                    ),
                  ),
                ],
              ),
              if (_model.showLoading)
                wrapWithModel(
                  model: _model.sucessMsgModel,
                  updateCallback: () => setState(() {}),
                  child: SucessMsgWidget(
                    msg: getJsonField(
                      (_model.createProductDetails?.jsonBody ?? ''),
                      r'''$.data.message''',
                    ).toString(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
