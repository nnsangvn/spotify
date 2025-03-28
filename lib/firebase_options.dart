// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

  static FirebaseOptions web = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_WEB'] ?? '',
    appId: '1:270001065319:web:cdd3097585bc2fcab8b3c2',
    messagingSenderId: '270001065319',
    projectId: 'spotify-eda4b',
    authDomain: 'spotify-eda4b.firebaseapp.com',
    storageBucket: 'spotify-eda4b.firebasestorage.app',
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_ANDROID'] ?? '',
    appId: '1:270001065319:android:f2c0481fd7026976b8b3c2',
    messagingSenderId: '270001065319',
    projectId: 'spotify-eda4b',
    storageBucket: 'spotify-eda4b.firebasestorage.app',
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.env['FIREBASE_API_KEY_IOS'] ?? '',
    appId: '1:270001065319:ios:92cdf68710dbe2f4b8b3c2',
    messagingSenderId: '270001065319',
    projectId: 'spotify-eda4b',
    storageBucket: 'spotify-eda4b.firebasestorage.app',
    iosBundleId: 'com.example.spotify',
  );

  static FirebaseOptions macos = ios;
  static FirebaseOptions windows = web;
}
