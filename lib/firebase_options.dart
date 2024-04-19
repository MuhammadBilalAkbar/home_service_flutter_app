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
    apiKey: 'AIzaSyBAzUrAaP8h5Guc_0KvIxj2jE1pVSxAJJE',
    appId: '1:377312768094:web:59ab904182067145bf04cf',
    messagingSenderId: '377312768094',
    projectId: 'home-service-app-3565e',
    authDomain: 'home-service-app-3565e.firebaseapp.com',
    storageBucket: 'home-service-app-3565e.appspot.com',
    measurementId: 'G-XYJ74G126W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-3dgA-ApZtScaTIuwm12v1phdiv1v2YI',
    appId: '1:377312768094:android:1cdaec79dfa74960bf04cf',
    messagingSenderId: '377312768094',
    projectId: 'home-service-app-3565e',
    storageBucket: 'home-service-app-3565e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwG4CV_3Yo5KekaO6i6dz4H6IFOmlIpkI',
    appId: '1:377312768094:ios:e1dca70f407b8daabf04cf',
    messagingSenderId: '377312768094',
    projectId: 'home-service-app-3565e',
    storageBucket: 'home-service-app-3565e.appspot.com',
    iosBundleId: 'com.example.homeServiceFlutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwG4CV_3Yo5KekaO6i6dz4H6IFOmlIpkI',
    appId: '1:377312768094:ios:e1dca70f407b8daabf04cf',
    messagingSenderId: '377312768094',
    projectId: 'home-service-app-3565e',
    storageBucket: 'home-service-app-3565e.appspot.com',
    iosBundleId: 'com.example.homeServiceFlutterApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBAzUrAaP8h5Guc_0KvIxj2jE1pVSxAJJE',
    appId: '1:377312768094:web:e5fe70889ed01db8bf04cf',
    messagingSenderId: '377312768094',
    projectId: 'home-service-app-3565e',
    authDomain: 'home-service-app-3565e.firebaseapp.com',
    storageBucket: 'home-service-app-3565e.appspot.com',
    measurementId: 'G-D669RGZY1Y',
  );
}