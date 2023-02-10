import '../backend/api_requests/api_calls.dart';
import '../components/appbar_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String productSelectedCountryCode = 'NULL';

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for appbar component.
  late AppbarModel appbarModel;
  bool isMediaUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for FirstNTextField widget.
  TextEditingController? firstNTextFieldController;
  String? Function(BuildContext, String?)? firstNTextFieldControllerValidator;
  String? _firstNTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ygbk1uyd' /* First Name is required */,
      );
    }

    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for YourEmailTextField widget.
  TextEditingController? yourEmailTextFieldController;
  String? Function(BuildContext, String?)?
      yourEmailTextFieldControllerValidator;
  String? _yourEmailTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'b4j4zq3r' /* Email Field is required */,
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

  // State field(s) for PublicNTextField widget.
  TextEditingController? publicNTextFieldController;
  String? Function(BuildContext, String?)? publicNTextFieldControllerValidator;
  String? _publicNTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '11lkxwjs' /* Public Name is required */,
      );
    }

    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for DropDownGender widget.
  int? dropDownGenderValue;
  // State field(s) for ShopURLTextField widget.
  TextEditingController? shopURLTextFieldController;
  String? Function(BuildContext, String?)? shopURLTextFieldControllerValidator;
  // State field(s) for contactnoTextField widget.
  TextEditingController? contactnoTextFieldController;
  String? Function(BuildContext, String?)?
      contactnoTextFieldControllerValidator;
  // Stores action output result for [Backend Call - API (update user details )] action in Tab1SaveButton widget.
  ApiCallResponse? apiResult7rj;
  // State field(s) for txtCompanyName widget.
  TextEditingController? txtCompanyNameController;
  String? Function(BuildContext, String?)? txtCompanyNameControllerValidator;
  // State field(s) for txtEmail widget.
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  // State field(s) for txtcontactnumber widget.
  TextEditingController? txtcontactnumberController;
  String? Function(BuildContext, String?)? txtcontactnumberControllerValidator;
  String? _txtcontactnumberControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tftwgqjq' /* Contact Number is required */,
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

  // State field(s) for txtwhatsappnumber widget.
  TextEditingController? txtwhatsappnumberController;
  String? Function(BuildContext, String?)? txtwhatsappnumberControllerValidator;
  String? _txtwhatsappnumberControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uuwzcakn' /* Whatsapp number is required */,
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

  // State field(s) for txtAbout widget.
  TextEditingController? txtAboutController;
  String? Function(BuildContext, String?)? txtAboutControllerValidator;
  // State field(s) for txtFacebookId widget.
  TextEditingController? txtFacebookIdController;
  String? Function(BuildContext, String?)? txtFacebookIdControllerValidator;
  String? _txtFacebookIdControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jo1zt6nr' /* Social Media Link is required */,
      );
    }

    return null;
  }

  // State field(s) for txttwitterlink widget.
  TextEditingController? txttwitterlinkController;
  String? Function(BuildContext, String?)? txttwitterlinkControllerValidator;
  bool isMediaUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isMediaUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for txtbusinessAddress widget.
  TextEditingController? txtbusinessAddressController;
  String? Function(BuildContext, String?)?
      txtbusinessAddressControllerValidator;
  String? _txtbusinessAddressControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ecoog53e' /* Business Address is required */,
      );
    }

    if (val.length > 150) {
      return 'Maximum 150 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for txtMetaKeyword widget.
  TextEditingController? txtMetaKeywordController;
  String? Function(BuildContext, String?)? txtMetaKeywordControllerValidator;
  String? _txtMetaKeywordControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 60) {
      return 'Maximum 60 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for txtMetadescription widget.
  TextEditingController? txtMetadescriptionController;
  String? Function(BuildContext, String?)?
      txtMetadescriptionControllerValidator;
  String? _txtMetadescriptionControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 250) {
      return 'Maximum 250 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for txtAddress widget.
  TextEditingController? txtAddressController;
  String? Function(BuildContext, String?)? txtAddressControllerValidator;
  String? _txtAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bo6xwu0z' /* Address is required */,
      );
    }

    return null;
  }

  // State field(s) for txtCity widget.
  TextEditingController? txtCityController;
  String? Function(BuildContext, String?)? txtCityControllerValidator;
  String? _txtCityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'iyz1rz3f' /* City is required */,
      );
    }

    return null;
  }

  // State field(s) for txtZip widget.
  TextEditingController? txtZipController;
  String? Function(BuildContext, String?)? txtZipControllerValidator;
  String? _txtZipControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6tmywdg6' /* Zip is required */,
      );
    }

    return null;
  }

  // State field(s) for txtState widget.
  TextEditingController? txtStateController;
  String? Function(BuildContext, String?)? txtStateControllerValidator;
  String? _txtStateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd9ku6dhx' /* State is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDownCountry widget.
  String? dropDownCountryValue;
  // Stores action output result for [Backend Call - API (update company details)] action in companyDetailButton widget.
  ApiCallResponse? apiCompanyResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    firstNTextFieldControllerValidator = _firstNTextFieldControllerValidator;
    yourEmailTextFieldControllerValidator =
        _yourEmailTextFieldControllerValidator;
    publicNTextFieldControllerValidator = _publicNTextFieldControllerValidator;
    txtcontactnumberControllerValidator = _txtcontactnumberControllerValidator;
    txtwhatsappnumberControllerValidator =
        _txtwhatsappnumberControllerValidator;
    txtFacebookIdControllerValidator = _txtFacebookIdControllerValidator;
    txtbusinessAddressControllerValidator =
        _txtbusinessAddressControllerValidator;
    txtMetaKeywordControllerValidator = _txtMetaKeywordControllerValidator;
    txtMetadescriptionControllerValidator =
        _txtMetadescriptionControllerValidator;
    txtAddressControllerValidator = _txtAddressControllerValidator;
    txtCityControllerValidator = _txtCityControllerValidator;
    txtZipControllerValidator = _txtZipControllerValidator;
    txtStateControllerValidator = _txtStateControllerValidator;
  }

  void dispose() {
    firstNTextFieldController?.dispose();
    yourEmailTextFieldController?.dispose();
    publicNTextFieldController?.dispose();
    shopURLTextFieldController?.dispose();
    contactnoTextFieldController?.dispose();
    txtCompanyNameController?.dispose();
    txtEmailController?.dispose();
    txtcontactnumberController?.dispose();
    txtwhatsappnumberController?.dispose();
    txtAboutController?.dispose();
    txtFacebookIdController?.dispose();
    txttwitterlinkController?.dispose();
    txtbusinessAddressController?.dispose();
    txtMetaKeywordController?.dispose();
    txtMetadescriptionController?.dispose();
    txtAddressController?.dispose();
    txtCityController?.dispose();
    txtZipController?.dispose();
    txtStateController?.dispose();
  }

  /// Additional helper methods are added here.

}
