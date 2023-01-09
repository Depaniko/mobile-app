import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyChphtAHeUkz1T_xmFB3JoFO64D_wvglDM",
            authDomain: "artiz-7d964.firebaseapp.com",
            projectId: "artiz-7d964",
            storageBucket: "artiz-7d964.appspot.com",
            messagingSenderId: "209744150328",
            appId: "1:209744150328:web:7b829b573e1994dc980bcd",
            measurementId: "G-6L7GWYDWD3"));
  } else {
    await Firebase.initializeApp();
  }
}
