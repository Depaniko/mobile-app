// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class EmbeddedJitsi extends StatefulWidget {
  const EmbeddedJitsi({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;
  @override
  State<EmbeddedJitsi> createState() => _EmbeddedJitsiState();
}

class _EmbeddedJitsiState extends State<EmbeddedJitsi> {
  String title = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://meet.jit.si/depaniko#config.disableDeepLinking=true&config.prejoinPageEnabled=false")),
        initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              mediaPlaybackRequiresUserGesture: false,
            ),
            ios: IOSInAppWebViewOptions(
              allowsInlineMediaPlayback: true,
            )),
        androidOnPermissionRequest: (InAppWebViewController controller,
            String origin, List<String> resources) async {
          await Permission.camera.request();
          await Permission.microphone.request();
          return PermissionRequestResponse(
              resources: resources,
              action: PermissionRequestResponseAction.GRANT);
        },
      ),
    );
  }
}
