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
    apiKey: 'AIzaSyCUvYhHDlRUYrdt6QaeTogyG5boY9HaNq4',
    appId: '1:723162687615:web:2a107be0f5a283e988b74a',
    messagingSenderId: '723162687615',
    projectId: 'iaad-c34f4',
    authDomain: 'iaad-c34f4.firebaseapp.com',
    storageBucket: 'iaad-c34f4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHJiBV2OXjuxfTo2SvPLDbwKa1vMLx-EM',
    appId: '1:723162687615:android:d046c500709a904888b74a',
    messagingSenderId: '723162687615',
    projectId: 'iaad-c34f4',
    storageBucket: 'iaad-c34f4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEtz_xoisEWR6bhyFNXeFr2PsuwwPmYgI',
    appId: '1:723162687615:ios:ac95f0bce5ffcc2888b74a',
    messagingSenderId: '723162687615',
    projectId: 'iaad-c34f4',
    storageBucket: 'iaad-c34f4.appspot.com',
    iosClientId: '723162687615-es1m8v42ilmtmke7g7h8ltud5lbkc8ai.apps.googleusercontent.com',
    iosBundleId: 'com.example.iaad',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEtz_xoisEWR6bhyFNXeFr2PsuwwPmYgI',
    appId: '1:723162687615:ios:ac95f0bce5ffcc2888b74a',
    messagingSenderId: '723162687615',
    projectId: 'iaad-c34f4',
    storageBucket: 'iaad-c34f4.appspot.com',
    iosClientId: '723162687615-es1m8v42ilmtmke7g7h8ltud5lbkc8ai.apps.googleusercontent.com',
    iosBundleId: 'com.example.iaad',
  );
}