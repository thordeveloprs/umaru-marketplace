import '../backend/api_requests/api_calls.dart';
import '../components/appbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for appbar component.
  late AppbarModel appbarModel;
  // State field(s) for SearchPageTextField widget.
  TextEditingController? searchPageTextFieldController;
  String? Function(BuildContext, String?)?
      searchPageTextFieldControllerValidator;
  // Stores action output result for [Backend Call - API (search)] action in SearchPageTextField widget.
  ApiCallResponse? searchResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
  }

  void dispose() {
    searchPageTextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
