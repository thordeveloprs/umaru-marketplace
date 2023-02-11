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

class EditProductModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool showLoading = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for appbar component.
  late AppbarModel appbarModel;
  // State field(s) for txtProductName widget.
  TextEditingController? txtProductNameController;
  String? Function(BuildContext, String?)? txtProductNameControllerValidator;
  // State field(s) for txtSku widget.
  TextEditingController? txtSkuController;
  String? Function(BuildContext, String?)? txtSkuControllerValidator;
  // State field(s) for txtPrice widget.
  TextEditingController? txtPriceController;
  String? Function(BuildContext, String?)? txtPriceControllerValidator;
  // State field(s) for SwitchISetSpecialPrice widget.
  bool? switchISetSpecialPriceValue;
  // State field(s) for txSpecialPrice widget.
  TextEditingController? txSpecialPriceController;
  String? Function(BuildContext, String?)? txSpecialPriceControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for txQuantity widget.
  TextEditingController? txQuantityController;
  String? Function(BuildContext, String?)? txQuantityControllerValidator;
  // State field(s) for txWeight widget.
  TextEditingController? txWeightController;
  String? Function(BuildContext, String?)? txWeightControllerValidator;
  // State field(s) for DropDownStocksta widget.
  String? dropDownStockstaValue;
  DateTime? datePicked3;
  DateTime? datePicked4;
  // State field(s) for SwitchIsFeature widget.
  bool? switchIsFeatureValue;
  // State field(s) for DropDownCountry widget.
  String? dropDownCountryValue;
  // State field(s) for DropDownCategory widget.
  String? dropDownCategoryValue;
  // Stores action output result for [Custom Action - createSubCategoryOnCategorySelect] action in DropDownCategory widget.
  List<String>? selectedCategory;
  // State field(s) for DropDownsubcategory widget.
  String? dropDownsubcategoryValue;
  // Stores action output result for [Custom Action - getSubCategoryId] action in DropDownsubcategory widget.
  String? subCategoryId;
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for shortdescriptiontxt widget.
  TextEditingController? shortdescriptiontxtController;
  String? Function(BuildContext, String?)?
      shortdescriptiontxtControllerValidator;
  // State field(s) for descriptiontxt widget.
  TextEditingController? descriptiontxtController;
  String? Function(BuildContext, String?)? descriptiontxtControllerValidator;
  // State field(s) for txtMetaTitle widget.
  TextEditingController? txtMetaTitleController;
  String? Function(BuildContext, String?)? txtMetaTitleControllerValidator;
  // State field(s) for metadesTxt widget.
  TextEditingController? metadesTxtController;
  String? Function(BuildContext, String?)? metadesTxtControllerValidator;
  // Stores action output result for [Backend Call - API (edit product)] action in Tab1SaveButton widget.
  ApiCallResponse? editApiResult;
  // Model for sucessMsg component.
  late SucessMsgModel sucessMsgModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    sucessMsgModel = createModel(context, () => SucessMsgModel());
  }

  void dispose() {
    txtProductNameController?.dispose();
    txtSkuController?.dispose();
    txtPriceController?.dispose();
    txSpecialPriceController?.dispose();
    txQuantityController?.dispose();
    txWeightController?.dispose();
    shortdescriptiontxtController?.dispose();
    descriptiontxtController?.dispose();
    txtMetaTitleController?.dispose();
    metadesTxtController?.dispose();
  }

  /// Additional helper methods are added here.

}
