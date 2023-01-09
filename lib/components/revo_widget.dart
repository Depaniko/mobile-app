import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RevoWidget extends StatefulWidget {
  const RevoWidget({Key? key}) : super(key: key);

  @override
  _RevoWidgetState createState() => _RevoWidgetState();
}

class _RevoWidgetState extends State<RevoWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Html(
      data:
          '<script>!function(e,o,t){e[t]=function(n,r){var c={sandbox:\"https://sandbox-merchant.revolut.com/embed.js\",prod:\"https://merchant.revolut.com/embed.js\",dev:\"https://merchant.revolut.codes/embed.js\"},d=o.createElement(\"script\");d.id=\"revolut-checkout\",d.src=c[r]||c.prod,d.async=!0,o.head.appendChild(d);var s={then:function(r,c){d.onload=function(){r(e[t](n))},d.onerror=function(){o.head.removeChild(d),c&&c(new Error(t+\" is failed to load\"))}}};return\"function\"==typeof Promise?Promise.resolve(s):s}}(window,document,\"RevolutCheckout\");</script>\n\n\n',
    );
  }
}
