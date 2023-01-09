import '../components/see_document_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuotesigningWidget extends StatefulWidget {
  const QuotesigningWidget({
    Key? key,
    this.quote,
    this.status,
    this.offerid,
  }) : super(key: key);

  final String? quote;
  final String? status;
  final String? offerid;

  @override
  _QuotesigningWidgetState createState() => _QuotesigningWidgetState();
}

class _QuotesigningWidgetState extends State<QuotesigningWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
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
          child: SeeDocumentWidget(
            docurl: widget.quote,
            offerid: widget.offerid,
            offerstatus: widget.status,
          ),
        ),
      ),
    );
  }
}
