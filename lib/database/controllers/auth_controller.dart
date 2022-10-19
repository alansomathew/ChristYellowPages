import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../design/screens/home/home_screen.dart';
import '../../design/screens/splashScreen/onboarding_screen.dart';
import '../../design/screens/splashScreen/welcome_screen.dart';
import '../firebase_ref/references.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final _user = Rxn<User>();
  var isSignIn = false.obs;
  late Stream<User?> _authStateChanges;

  @override
  void onReady() async {
    initAuth();
    await Future.delayed(const Duration(seconds: 5));
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = _auth.currentUser != null;
    _auth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });
    super.onReady();
  }

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToHome();
  }

  signInWithGoogle() async {
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
        navigateToHome();
      }
    } on Exception catch (error) {
      log(error.toString());
      navigateToWelcome();
    }
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    // print(_user.value);
    return _user.value;
  }

  void navigateToIndroduction() {
    Get.offAllNamed(OnBoardingScreen.routeName);
  }

  void navigateToWelcome() {
    Get.offAllNamed(WelcomeScreen.routeName);
  }

  void navigateToHome() {
    Get.offAllNamed(HomeScreen.routeName);
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

  void handleAuthStateChanged(isLoggedIn) {
    if (isLoggedIn) {
      Get.offAllNamed(HomeScreen.routeName, arguments: _auth.currentUser);
    } else {
      Get.offAllNamed(WelcomeScreen.routeName);
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.disconnect();
      await _auth.signOut();
      navigateToWelcome();
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      navigateToHome();
    }
  }
}
