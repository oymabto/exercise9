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
    apiKey: 'AIzaSyC4EWBGhTbKlv5nHWB_qbB-UCGjykdwkV0',
    appId: '1:227603349212:web:4b6dd60d644120764f3e19',
    messagingSenderId: '227603349212',
    projectId: 'fir-flutter-codelab-7c74a',
    authDomain: 'fir-flutter-codelab-7c74a.firebaseapp.com',
    databaseURL: 'https://fir-flutter-codelab-7c74a-default-rtdb.firebaseio.com',
    storageBucket: 'fir-flutter-codelab-7c74a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBe4hXLqNrP9fEPEUTQqDN_JF8e2xuhdzc',
    appId: '1:227603349212:android:1399d20ca33918c34f3e19',
    messagingSenderId: '227603349212',
    projectId: 'fir-flutter-codelab-7c74a',
    databaseURL: 'https://fir-flutter-codelab-7c74a-default-rtdb.firebaseio.com',
    storageBucket: 'fir-flutter-codelab-7c74a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBctvKvpDwmkkkleEkxxTpwUxxCWok_xaw',
    appId: '1:227603349212:ios:a4f7c398bdc812fe4f3e19',
    messagingSenderId: '227603349212',
    projectId: 'fir-flutter-codelab-7c74a',
    databaseURL: 'https://fir-flutter-codelab-7c74a-default-rtdb.firebaseio.com',
    storageBucket: 'fir-flutter-codelab-7c74a.appspot.com',
    iosClientId: '227603349212-lb49nvc9gfefrvp2r75p1ts4dfn5un0o.apps.googleusercontent.com',
    iosBundleId: 'com.example.exercise9',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBctvKvpDwmkkkleEkxxTpwUxxCWok_xaw',
    appId: '1:227603349212:ios:6644e635a10a8c644f3e19',
    messagingSenderId: '227603349212',
    projectId: 'fir-flutter-codelab-7c74a',
    databaseURL: 'https://fir-flutter-codelab-7c74a-default-rtdb.firebaseio.com',
    storageBucket: 'fir-flutter-codelab-7c74a.appspot.com',
    iosClientId: '227603349212-ravreo3jslr6dpp4g1i8m8pgvp86iomf.apps.googleusercontent.com',
    iosBundleId: 'com.example.exercise9.RunnerTests',
  );
}
