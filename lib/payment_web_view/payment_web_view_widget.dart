import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_web_view_model.dart';
export 'payment_web_view_model.dart';

class PaymentWebViewWidget extends StatefulWidget {
  const PaymentWebViewWidget({
    Key? key,
    this.url,
  }) : super(key: key);

  final String? url;

  @override
  _PaymentWebViewWidgetState createState() => _PaymentWebViewWidgetState();
}

class _PaymentWebViewWidgetState extends State<PaymentWebViewWidget> {
  late PaymentWebViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentWebViewModel());
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          FFLocalizations.of(context).getText(
            'v2mqw0qq' /* Payment */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1,
                child: custom_widgets.PaymentWebView(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
                  url: widget.url!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
