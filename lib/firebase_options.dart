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
    apiKey: 'AIzaSyAiT14mbx4skXM4zBWIIiwPcs8Lv1feIY0',
    appId: '1:127426197677:web:44c2ec5cfd1915f8bfee24',
    messagingSenderId: '127426197677',
    projectId: 'nectar-8a088',
    authDomain: 'nectar-8a088.firebaseapp.com',
    storageBucket: 'nectar-8a088.appspot.com',
    measurementId: 'G-91X6E1LDQW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLHTKH09LzVI9iMwmfwb4k62VPoOzWCi8',
    appId: '1:127426197677:android:cf2dc518028e9f19bfee24',
    messagingSenderId: '127426197677',
    projectId: 'nectar-8a088',
    storageBucket: 'nectar-8a088.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1VTcqLjrXZTPSIwXONGCBX-3LxRuD9s8',
    appId: '1:127426197677:ios:effe029b5a4b9bc2bfee24',
    messagingSenderId: '127426197677',
    projectId: 'nectar-8a088',
    storageBucket: 'nectar-8a088.appspot.com',
    iosBundleId: 'com.example.nectarProject1',
  );
}