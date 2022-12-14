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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA2n34MEbtJUUwC8rxwmi5wteiWwG7feuM',
    appId: '1:56789226060:web:d23bbd70ea88537afb1ae9',
    messagingSenderId: '56789226060',
    projectId: 'mediqcm',
    authDomain: 'mediqcm.firebaseapp.com',
    storageBucket: 'mediqcm.appspot.com',
    measurementId: 'G-N7096B7P8D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKzWb30XqXFWFT7yqeoV-qnGRCuOYIbyY',
    appId: '1:56789226060:android:50a82a9fc45d88e2fb1ae9',
    messagingSenderId: '56789226060',
    projectId: 'mediqcm',
    storageBucket: 'mediqcm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrppKhOETPdYo7KjunJa5B-jBFZ81A99o',
    appId: '1:56789226060:ios:e5d675adb71f4694fb1ae9',
    messagingSenderId: '56789226060',
    projectId: 'mediqcm',
    storageBucket: 'mediqcm.appspot.com',
    iosClientId: '56789226060-norir3588hb0hanbivb298vhc9uc4lp1.apps.googleusercontent.com',
    iosBundleId: 'com.example.mediqcm',
  );
}
