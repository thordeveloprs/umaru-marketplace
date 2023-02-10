import '../components/appbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for appbar component.
  late AppbarModel appbarModel;
  // State field(s) for oldPassword widget.
  TextEditingController? oldPasswordController;
  late bool oldPasswordVisibility;
  String? Function(BuildContext, String?)? oldPasswordControllerValidator;
  String? _oldPasswordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lami9rc5' /* Old Password is required */,
      );
    }

    return null;
  }

  // State field(s) for txtPassword widget.
  TextEditingController? txtPasswordController1;
  late bool txtPasswordVisibility1;
  String? Function(BuildContext, String?)? txtPasswordController1Validator;
  String? _txtPasswordController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ir8ckcpm' /* New Password is required */,
      );
    }

    return null;
  }

  // State field(s) for txtPassword widget.
  TextEditingController? txtPasswordController2;
  late bool txtPasswordVisibility2;
  String? Function(BuildContext, String?)? txtPasswordController2Validator;
  String? _txtPasswordController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9qpko8cd' /* Confirm New Password is requir... */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    oldPasswordVisibility = false;
    oldPasswordControllerValidator = _oldPasswordControllerValidator;
    txtPasswordVisibility1 = false;
    txtPasswordController1Validator = _txtPasswordController1Validator;
    txtPasswordVisibility2 = false;
    txtPasswordController2Validator = _txtPasswordController2Validator;
  }

  void dispose() {
    oldPasswordController?.dispose();
    txtPasswordController1?.dispose();
    txtPasswordController2?.dispose();
  }

  /// Additional helper methods are added here.

}
