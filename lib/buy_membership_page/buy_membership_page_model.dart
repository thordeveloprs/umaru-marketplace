import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuyMembershipPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool showLoading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Subscription Details)] action in BuyMembershipPage widget.
  ApiCallResponse? subscriptionResult;
  // Stores action output result for [Backend Call - API (Subscription add to cart)] action in Button widget.
  ApiCallResponse? addToCartResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
