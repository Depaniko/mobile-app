import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DepanikoFirebaseUser {
  DepanikoFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

DepanikoFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DepanikoFirebaseUser> depanikoFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<DepanikoFirebaseUser>(
      (user) {
        currentUser = DepanikoFirebaseUser(user);
        return currentUser!;
      },
    );
