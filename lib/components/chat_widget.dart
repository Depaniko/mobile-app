import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    Key? key,
    this.chatdata,
    this.offerid,
  }) : super(key: key);

  final dynamic chatdata;
  final String? offerid;

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  ApiCallResponse? apiResultn10;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: Builder(
            builder: (context) {
              final allmessages = FFAppState().messagesdata.toList();
              return RefreshIndicator(
                onRefresh: () async {
                  apiResultn10 = await RocketgetmessagesCall.call(
                    roomid: 'F975y4y6ykseBx3LKinitialuser',
                    usertoken: '00BSkeLpLeYZFzhCNDOSEqP04dVHI3guO9wQFwa9Amo',
                    userid: 'initialuser',
                  );
                  FFAppState().update(() {
                    FFAppState().messagesdata = RocketgetmessagesCall.messages(
                      (apiResultn10?.jsonBody ?? ''),
                    ).toList();
                  });
                },
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  reverse: true,
                  primary: false,
                  scrollDirection: Axis.vertical,
                  itemCount: allmessages.length,
                  itemBuilder: (context, allmessagesIndex) {
                    final allmessagesItem = allmessages[allmessagesIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 3),
                      child: custom_widgets.CustomBubbleWidget(
                        width: MediaQuery.of(context).size.width * 0.99,
                        height: 65,
                        side: getJsonField(
                              allmessagesItem,
                              r'''$.u.username''',
                            ) ==
                            'tguinot',
                        contentmessage: getJsonField(
                          allmessagesItem,
                          r'''$.msg''',
                        ).toString(),
                        offerid: widget.offerid!,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
