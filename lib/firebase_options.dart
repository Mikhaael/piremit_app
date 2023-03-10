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
    apiKey: 'AIzaSyDOpGcRj8Ui_f2H9dO1Yvs4ONZVfyGUDAY',
    appId: '1:57687386174:web:59260d0ac08a317872896f',
    messagingSenderId: '57687386174',
    projectId: 'piremit-banking-app-98373',
    authDomain: 'piremit-banking-app-98373.firebaseapp.com',
    databaseURL: 'https://piremit-banking-app-98373-default-rtdb.firebaseio.com',
    storageBucket: 'piremit-banking-app-98373.appspot.com',
    measurementId: 'G-NZT51MR7WX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCxeEebJBVbVf0xlUma2wUmgEOAUxRNlA',
    appId: '1:57687386174:android:a4bdd2222d4fabc472896f',
    messagingSenderId: '57687386174',
    projectId: 'piremit-banking-app-98373',
    databaseURL: 'https://piremit-banking-app-98373-default-rtdb.firebaseio.com',
    storageBucket: 'piremit-banking-app-98373.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMJg6J4UVY7xNVOKnWTYuXgEYC-7dgzuE',
    appId: '1:57687386174:ios:c49e32c59a9114ee72896f',
    messagingSenderId: '57687386174',
    projectId: 'piremit-banking-app-98373',
    databaseURL: 'https://piremit-banking-app-98373-default-rtdb.firebaseio.com',
    storageBucket: 'piremit-banking-app-98373.appspot.com',
    iosClientId: '57687386174-gvm9us1o845dqc3ej5krqj8okf2lep1p.apps.googleusercontent.com',
    iosBundleId: 'com.example.piremitApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBMJg6J4UVY7xNVOKnWTYuXgEYC-7dgzuE',
    appId: '1:57687386174:ios:c49e32c59a9114ee72896f',
    messagingSenderId: '57687386174',
    projectId: 'piremit-banking-app-98373',
    databaseURL: 'https://piremit-banking-app-98373-default-rtdb.firebaseio.com',
    storageBucket: 'piremit-banking-app-98373.appspot.com',
    iosClientId: '57687386174-gvm9us1o845dqc3ej5krqj8okf2lep1p.apps.googleusercontent.com',
    iosBundleId: 'com.example.piremitApp',
  );
}
