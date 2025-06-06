// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;
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
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

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
}
