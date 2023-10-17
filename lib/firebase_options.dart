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
    apiKey: 'AIzaSyCHOo6jXhYxjWjmEA0_CO2LxZ4UBqNxCQc',
    appId: '1:253048529231:web:7ce34d8437905710af653a',
    messagingSenderId: '253048529231',
    projectId: 'dress-app-d1bca',
    authDomain: 'dress-app-d1bca.firebaseapp.com',
    storageBucket: 'dress-app-d1bca.appspot.com',
    measurementId: 'G-GCJR0K7P0T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3rtOrco6Zjs3tHCf9Go-EKXN1XYuZw9Y',
    appId: '1:253048529231:android:568a8a20a40c0b20af653a',
    messagingSenderId: '253048529231',
    projectId: 'dress-app-d1bca',
    storageBucket: 'dress-app-d1bca.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBE5fMKE3QmnCTxiF3djUNJl_7mZSTEs3U',
    appId: '1:253048529231:ios:d83d1ff1bf8d7998af653a',
    messagingSenderId: '253048529231',
    projectId: 'dress-app-d1bca',
    storageBucket: 'dress-app-d1bca.appspot.com',
    iosBundleId: 'com.dress.design.dressApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBE5fMKE3QmnCTxiF3djUNJl_7mZSTEs3U',
    appId: '1:253048529231:ios:6ea0dad6085142d7af653a',
    messagingSenderId: '253048529231',
    projectId: 'dress-app-d1bca',
    storageBucket: 'dress-app-d1bca.appspot.com',
    iosBundleId: 'com.dress.design.dressApp.RunnerTests',
  );
}