import '../components/questionwidget_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionspullupWidget extends StatefulWidget {
  const QuestionspullupWidget({Key? key}) : super(key: key);

  @override
  _QuestionspullupWidgetState createState() => _QuestionspullupWidgetState();
}

class _QuestionspullupWidgetState extends State<QuestionspullupWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 8),
              child: Builder(
                builder: (context) {
                  final questionsdata = FFAppState().currentquestions.toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: questionsdata.length,
                    itemBuilder: (context, questionsdataIndex) {
                      final questionsdataItem =
                          questionsdata[questionsdataIndex];
                      return QuestionwidgetWidget(
                        key: UniqueKey(),
                        name: getJsonField(
                          questionsdataItem,
                          r'''$.company_name''',
                        ).toString(),
                        contentquestion: getJsonField(
                          questionsdataItem,
                          r'''$.content''',
                        ).toString(),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
