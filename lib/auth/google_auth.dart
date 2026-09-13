import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  static final GoogleSignIn _googleAuth = GoogleSignIn.instance;
  static bool isInitializ = false;

  static Future<void> _initSingIN() async {
    if (!isInitializ) {
      await _googleAuth.initialize(
        clientId:
            '906970457877-fd2m0r79or98digq9jj97rlcfe3v4h9n.apps.googleusercontent.com',
      );
      isInitializ = true;
    }
  }

  static Future<UserCredential?> SinInWithgoogle() async {
    await _initSingIN();
    GoogleSignInAccount accouunt = await _googleAuth.authenticate();

    final idToken = accouunt.authentication.idToken;
    final authAccount = accouunt.authorizationClient;
    GoogleSignInClientAuthorization? authz = await authAccount
        .authorizationForScopes(['email', 'profile']);

    final acsstoken = authz?.accessToken;

    final credential = GoogleAuthProvider.credential(
      idToken: idToken,
      accessToken: acsstoken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // select account
}
