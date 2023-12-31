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
    apiKey: 'AIzaSyBFGgzzy_uwwd6AS-6cVUKpkqtx0Y9mRz4',
    appId: '1:162597676272:web:f282dfb2388ca9df8e4e35',
    messagingSenderId: '162597676272',
    projectId: 'oshimai-dev',
    authDomain: 'oshimai-dev.firebaseapp.com',
    databaseURL: 'https://oshimai-dev-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'oshimai-dev.appspot.com',
    measurementId: 'G-Q3EY93P4P4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaFWst1mWCzSiJKUDRSEKD7ca7jSJKhrE',
    appId: '1:162597676272:android:64d743238cd3c6b78e4e35',
    messagingSenderId: '162597676272',
    projectId: 'oshimai-dev',
    databaseURL: 'https://oshimai-dev-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'oshimai-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKATwfyiKwRLD0NrxDtWNE4CvxeSsExsU',
    appId: '1:162597676272:ios:af0af7ef5f2ac25e8e4e35',
    messagingSenderId: '162597676272',
    projectId: 'oshimai-dev',
    databaseURL: 'https://oshimai-dev-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'oshimai-dev.appspot.com',
    iosClientId: '162597676272-p1l4lp7qsllmfch8sqbo19cla2lmvn44.apps.googleusercontent.com',
    iosBundleId: 'com.example.oshimai',
  );
}
