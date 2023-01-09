import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../workdetails/workdetails_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EstimateviewerWidget extends StatefulWidget {
  const EstimateviewerWidget({
    Key? key,
    this.orderdata,
  }) : super(key: key);

  final dynamic orderdata;

  @override
  _EstimateviewerWidgetState createState() => _EstimateviewerWidgetState();
}

class _EstimateviewerWidgetState extends State<EstimateviewerWidget> {
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Stack(
                children: [
                  FlutterFlowPdfViewer(
                    networkPath:
                        'https://eu-001.s3.synologyc2.net/depaniko-alpha/thomas-guinot-new/quotes/003.pdf?AWSAccessKeyId=euV11oxa7RnLdFw7HSCMRUEzXpsBzP68&Signature=VU2ZUNIYlPxFSw2V4qvROQd27zE%3D&Expires=1671424115',
                    width: double.infinity,
                    height: double.infinity,
                    horizontalScroll: false,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0.95),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WorkdetailsWidget(),
                              ),
                            );
                          },
                          text: 'Retour',
                          options: FFButtonOptions(
                            width: 110,
                            height: 40,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
