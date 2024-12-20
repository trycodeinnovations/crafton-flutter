// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDC9v28BGeuVPm7FvHF0ZmcXTEnl6wn5sw',
    appId: '1:447213125561:web:d6e052956dff96b1234068',
    messagingSenderId: '447213125561',
    projectId: 'crafton-587ca',
    authDomain: 'crafton-587ca.firebaseapp.com',
    storageBucket: 'crafton-587ca.appspot.com',
    measurementId: 'G-PDZ7Y9EF3S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1NOuBlPjMig_7mWzAG5655IHltdQBXkI',
    appId: '1:447213125561:android:0266d6816b2078c8234068',
    messagingSenderId: '447213125561',
    projectId: 'crafton-587ca',
    storageBucket: 'crafton-587ca.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDC9v28BGeuVPm7FvHF0ZmcXTEnl6wn5sw',
    appId: '1:447213125561:web:2ef9cab3996ed021234068',
    messagingSenderId: '447213125561',
    projectId: 'crafton-587ca',
    authDomain: 'crafton-587ca.firebaseapp.com',
    storageBucket: 'crafton-587ca.appspot.com',
    measurementId: 'G-BDXV2WBDEW',
  );
}
