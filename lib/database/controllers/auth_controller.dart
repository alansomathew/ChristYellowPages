import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../firebase_ref/references.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 5));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIndroduction();
  }

  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authaccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
          idToken: _authaccount.idToken,
          accessToken: _authaccount.accessToken,
        );
        await _auth.signInWithCredential(_credential);
        await saveUser(account);
        print(account);
      }
    } on Exception catch (error) {
      print(error);
    }
  }

  void navigateToIndroduction() {
    Get.offAllNamed("/home");
  }

  void navigateToWelcome() {
    Get.offAllNamed("/welcome");
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl,
    });
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
