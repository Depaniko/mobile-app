import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../signedquote/signedquote_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class ChangesignatureWidget extends StatefulWidget {
  const ChangesignatureWidget({
    Key? key,
    this.offerid,
  }) : super(key: key);

  final String? offerid;

  @override
  _ChangesignatureWidgetState createState() => _ChangesignatureWidgetState();
}

class _ChangesignatureWidgetState extends State<ChangesignatureWidget> {
  ApiCallResponse? signresult;
  String uploadedSignatureUrl = '';
  late SignatureController signatureController;

  @override
  void initState() {
    super.initState();
    signatureController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
  }

  @override
  void dispose() {
    signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        ClipRect(
          child: Signature(
            controller: signatureController,
            backgroundColor: Colors.white,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0.8),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Annuler',
                  options: FFButtonOptions(
                    width: 115,
                    height: 35,
                    color: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.8),
              child: FFButtonWidget(
                onPressed: () async {
                  final signatureImage = await signatureController.toPngBytes();

                  if (signatureImage == null) {
                    return;
                  }

                  showUploadMessage(
                    context,
                    'Uploading signature...',
                    showLoading: true,
                  );
                  final downloadUrl = (await uploadData(
                      getSignatureStoragePath(), signatureImage));

                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  if (downloadUrl != null) {
                    setState(() => uploadedSignatureUrl = downloadUrl);
                    showUploadMessage(
                      context,
                      'Success!',
                    );
                  } else {
                    showUploadMessage(
                      context,
                      'Failed to upload signature',
                    );
                    return;
                  }

                  FFAppState().update(() {
                    FFAppState().sigurl = uploadedSignatureUrl;
                  });
                  signresult = await SignquotepdfCall.call(
                    signatureUrl: FFAppState().sigurl,
                    offerid: widget.offerid,
                  );
                  if ((signresult?.succeeded ?? true)) {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignedquoteWidget(
                          orderid: widget.offerid,
                        ),
                      ),
                    );
                  }

                  setState(() {});
                },
                text: 'Enregistrer',
                options: FFButtonOptions(
                  width: 115,
                  height: 35,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
        Align(
          alignment: AlignmentDirectional(0, -0.95),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
            child: Text(
              'Dessinez votre signature ci-dessous',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
