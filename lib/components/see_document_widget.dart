import '../components/changesignature_widget.dart';
import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../workdetails/workdetails_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SeeDocumentWidget extends StatefulWidget {
  const SeeDocumentWidget({
    Key? key,
    this.docurl,
    this.offerid,
    this.offerstatus,
  }) : super(key: key);

  final String? docurl;
  final String? offerid;
  final String? offerstatus;

  @override
  _SeeDocumentWidgetState createState() => _SeeDocumentWidgetState();
}

class _SeeDocumentWidgetState extends State<SeeDocumentWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        FlutterFlowPdfViewer(
          networkPath: widget.docurl!,
          horizontalScroll: false,
        ),
        Align(
          alignment: AlignmentDirectional(0, 0.75),
          child: Container(
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkdetailsWidget(
                            offerId: widget.offerid,
                          ),
                        ),
                      );
                    },
                    text: 'Retour',
                    options: FFButtonOptions(
                      width: 100,
                      height: 40,
                      color: FlutterFlowTheme.of(context).alternate,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: FFAppState().normalfontsize,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                if (widget.offerstatus == 'quote_created')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (!(FFAppState().sigurl != null &&
                            FFAppState().sigurl != '')) {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  child: ChangesignatureWidget(
                                    offerid: widget.offerid,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        }
                      },
                      text: 'Signer',
                      icon: FaIcon(
                        FontAwesomeIcons.penNib,
                        size: 14,
                      ),
                      options: FFButtonOptions(
                        width: 100,
                        height: 40,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: FFAppState().normalfontsize,
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
          ),
        ),
      ],
    );
  }
}
