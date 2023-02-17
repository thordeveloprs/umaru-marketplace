import '../backend/api_requests/api_calls.dart';
import '../components/appbar_widget.dart';
import '../components/forgot_password_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LogInPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for appbar component.
  late AppbarModel appbarModel;
  // State field(s) for txtEmail widget.
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  String? _txtEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jekprojl' /* Email is required */,
      );
    }

    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for txtPassword widget.
  TextEditingController? txtPasswordController;
  late bool txtPasswordVisibility;
  String? Function(BuildContext, String?)? txtPasswordControllerValidator;
  String? _txtPasswordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1q7epzwu' /* Password is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (login)] action in Button widget.
  ApiCallResponse? loginData;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    txtEmailControllerValidator = _txtEmailControllerValidator;
    txtPasswordVisibility = false;
    txtPasswordControllerValidator = _txtPasswordControllerValidator;
  }

  void dispose() {
    appbarModel.dispose();
    txtEmailController?.dispose();
    txtPasswordController?.dispose();
  }

  /// Additional helper methods are added here.

}
