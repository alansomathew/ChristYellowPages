// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC52bnmBRxcJ8l-16S-L2Izm83fxiVhlSo',
    appId: '1:300258970398:web:cef321ef67821ae54fd70f',
    messagingSenderId: '300258970398',
    projectId: 'christ-yellowpages',
    authDomain: 'christ-yellowpages.firebaseapp.com',
    databaseURL: 'https://christ-yellowpages-default-rtdb.firebaseio.com',
    storageBucket: 'christ-yellowpages.appspot.com',
    measurementId: 'G-1508RBYB0X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC4eb0eMqUu23LZFm5dm1ceRmyZZqWzl0s',
    appId: '1:300258970398:android:e411ebc5230785854fd70f',
    messagingSenderId: '300258970398',
    projectId: 'christ-yellowpages',
    databaseURL: 'https://christ-yellowpages-default-rtdb.firebaseio.com',
    storageBucket: 'christ-yellowpages.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkipzrlQC4hydx9fqy4o-bVuZDXRRV8CI',
    appId: '1:300258970398:ios:cf0d16f5ea6ec7ca4fd70f',
    messagingSenderId: '300258970398',
    projectId: 'christ-yellowpages',
    databaseURL: 'https://christ-yellowpages-default-rtdb.firebaseio.com',
    storageBucket: 'christ-yellowpages.appspot.com',
    iosClientId: '300258970398-pcfv9a0hark74pj0ugct57ops1g9qcfl.apps.googleusercontent.com',
    iosBundleId: 'com.example.christYellowPages',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkipzrlQC4hydx9fqy4o-bVuZDXRRV8CI',
    appId: '1:300258970398:ios:cf0d16f5ea6ec7ca4fd70f',
    messagingSenderId: '300258970398',
    projectId: 'christ-yellowpages',
    databaseURL: 'https://christ-yellowpages-default-rtdb.firebaseio.com',
    storageBucket: 'christ-yellowpages.appspot.com',
    iosClientId: '300258970398-pcfv9a0hark74pj0ugct57ops1g9qcfl.apps.googleusercontent.com',
    iosBundleId: 'com.example.christYellowPages',
  );
}
