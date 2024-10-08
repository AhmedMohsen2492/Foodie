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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAcFITx7C9JKEZwLm5YiDVOt2KS8HU6pfQ',
    appId: '1:695297057684:web:fc03d588d004a86ec1a581',
    messagingSenderId: '695297057684',
    projectId: 'foodie-52823',
    authDomain: 'foodie-52823.firebaseapp.com',
    storageBucket: 'foodie-52823.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwVKZrkQXcqlPleGjHkdaLE7D5_-Jn8OE',
    appId: '1:695297057684:android:f3f2ef3674996c48c1a581',
    messagingSenderId: '695297057684',
    projectId: 'foodie-52823',
    storageBucket: 'foodie-52823.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUCGrK7N3kE91whkHEX7BVLAxRpTJ6OEo',
    appId: '1:695297057684:ios:cc1b5063997ba034c1a581',
    messagingSenderId: '695297057684',
    projectId: 'foodie-52823',
    storageBucket: 'foodie-52823.appspot.com',
    iosBundleId: 'com.example.foodie',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCUCGrK7N3kE91whkHEX7BVLAxRpTJ6OEo',
    appId: '1:695297057684:ios:cc1b5063997ba034c1a581',
    messagingSenderId: '695297057684',
    projectId: 'foodie-52823',
    storageBucket: 'foodie-52823.appspot.com',
    iosBundleId: 'com.example.foodie',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAcFITx7C9JKEZwLm5YiDVOt2KS8HU6pfQ',
    appId: '1:695297057684:web:b9f0b1c599685752c1a581',
    messagingSenderId: '695297057684',
    projectId: 'foodie-52823',
    authDomain: 'foodie-52823.firebaseapp.com',
    storageBucket: 'foodie-52823.appspot.com',
  );
}
