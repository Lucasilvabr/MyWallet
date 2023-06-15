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
    apiKey: 'AIzaSyAnIvfa5lRjpW1PrVpNR6FoEZfW0DmQpzg',
    appId: '1:76604121585:web:385eb222161fd055d92450',
    messagingSenderId: '76604121585',
    projectId: 'my-wallet-9cb0f',
    authDomain: 'my-wallet-9cb0f.firebaseapp.com',
    storageBucket: 'my-wallet-9cb0f.appspot.com',
    measurementId: 'G-D4JZH9LBC1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvG1N8XB3N6i5Ma6xLYKertP2MMdholj4',
    appId: '1:76604121585:android:cd28d95121957977d92450',
    messagingSenderId: '76604121585',
    projectId: 'my-wallet-9cb0f',
    storageBucket: 'my-wallet-9cb0f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBC00bB5msOF-9CwpHHuenmU_7vZ0yI64s',
    appId: '1:76604121585:ios:0e08dee381b4504fd92450',
    messagingSenderId: '76604121585',
    projectId: 'my-wallet-9cb0f',
    storageBucket: 'my-wallet-9cb0f.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBC00bB5msOF-9CwpHHuenmU_7vZ0yI64s',
    appId: '1:76604121585:ios:0e08dee381b4504fd92450',
    messagingSenderId: '76604121585',
    projectId: 'my-wallet-9cb0f',
    storageBucket: 'my-wallet-9cb0f.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}