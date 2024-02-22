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
    apiKey: 'AIzaSyBHRGOgKEnLcLAkFaSc0XME2mNPTvQNbN0',
    appId: '1:457954443778:web:fd07455bd663b49b239d1b',
    messagingSenderId: '457954443778',
    projectId: 'shop-flutter-9b122',
    authDomain: 'shop-flutter-9b122.firebaseapp.com',
    databaseURL: 'https://shop-flutter-9b122-default-rtdb.firebaseio.com',
    storageBucket: 'shop-flutter-9b122.appspot.com',
    measurementId: 'G-W1Y930LNJG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCt84JGMUmM-GEElGX9uokF450oP3pfVlw',
    appId: '1:457954443778:android:620b9b325cf54f6f239d1b',
    messagingSenderId: '457954443778',
    projectId: 'shop-flutter-9b122',
    databaseURL: 'https://shop-flutter-9b122-default-rtdb.firebaseio.com',
    storageBucket: 'shop-flutter-9b122.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1ebN4Pj2nEDZEj2Z-nyzOluSeUf_dRM4',
    appId: '1:457954443778:ios:a9248e3122ed71d6239d1b',
    messagingSenderId: '457954443778',
    projectId: 'shop-flutter-9b122',
    databaseURL: 'https://shop-flutter-9b122-default-rtdb.firebaseio.com',
    storageBucket: 'shop-flutter-9b122.appspot.com',
    androidClientId: '457954443778-ccdad3fkgbeu33auv5p8jkpfehsu0185.apps.googleusercontent.com',
    iosClientId: '457954443778-i9b4a5pntlerutnvv3684ua7gdotodhl.apps.googleusercontent.com',
    iosBundleId: 'com.example.shop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1ebN4Pj2nEDZEj2Z-nyzOluSeUf_dRM4',
    appId: '1:457954443778:ios:a9248e3122ed71d6239d1b',
    messagingSenderId: '457954443778',
    projectId: 'shop-flutter-9b122',
    databaseURL: 'https://shop-flutter-9b122-default-rtdb.firebaseio.com',
    storageBucket: 'shop-flutter-9b122.appspot.com',
    androidClientId: '457954443778-ccdad3fkgbeu33auv5p8jkpfehsu0185.apps.googleusercontent.com',
    iosClientId: '457954443778-i9b4a5pntlerutnvv3684ua7gdotodhl.apps.googleusercontent.com',
    iosBundleId: 'com.example.shop',
  );
}
