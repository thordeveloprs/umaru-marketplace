import '../backend/api_requests/api_calls.dart';
import '../components/appbar_widget.dart';
import '../components/sucess_msg_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterFormcompanyDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for appbar component.
  late AppbarModel appbarModel;
  // State field(s) for emal_id widget.
  TextEditingController? emalIdController;
  String? Function(BuildContext, String?)? emalIdControllerValidator;
  String? _emalIdControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uodie97m' /* Email Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'c29g6rnb' /* Contact number is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qm8p52yr' /* Whatsapp number  is required */,
      );
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for txtFacebookId widget.
  TextEditingController? txtFacebookIdController;
  String? Function(BuildContext, String?)? txtFacebookIdControllerValidator;
  String? _txtFacebookIdControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ss6wq0c5' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  String? _textController6Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1pi0d8h3' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (update company details)] action in Button widget.
  ApiCallResponse? apiResult5sa;
  // Model for sucessMsg component.
  late SucessMsgModel sucessMsgModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    emalIdControllerValidator = _emalIdControllerValidator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
    txtFacebookIdControllerValidator = _txtFacebookIdControllerValidator;
    textController6Validator = _textController6Validator;
    sucessMsgModel = createModel(context, () => SucessMsgModel());
  }

  void dispose() {
    emalIdController?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    txtFacebookIdController?.dispose();
    textController5?.dispose();
    textController6?.dispose();
  }

  /// Additional helper methods are added here.

}
