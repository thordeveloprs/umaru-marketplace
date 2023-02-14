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

  // State field(s) for txtNewPassword widget.
  TextEditingController? txtNewPasswordController;
  late bool txtNewPasswordVisibility;
  String? Function(BuildContext, String?)? txtNewPasswordControllerValidator;
  String? _txtNewPasswordControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ir8ckcpm' /* New Password is required */,
      );
    }

    return null;
  }

  // State field(s) for txtNewConfirmPassword widget.
  TextEditingController? txtNewConfirmPasswordController;
  late bool txtNewConfirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      txtNewConfirmPasswordControllerValidator;
  String? _txtNewConfirmPasswordControllerValidator(
      BuildContext context, String? val) {
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
    txtNewPasswordVisibility = false;
    txtNewPasswordControllerValidator = _txtNewPasswordControllerValidator;
    txtNewConfirmPasswordVisibility = false;
    txtNewConfirmPasswordControllerValidator =
        _txtNewConfirmPasswordControllerValidator;
  }

  void dispose() {
    oldPasswordController?.dispose();
    txtNewPasswordController?.dispose();
    txtNewConfirmPasswordController?.dispose();
  }

  /// Additional helper methods are added here.

}
