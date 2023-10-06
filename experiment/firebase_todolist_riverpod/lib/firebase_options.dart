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
    apiKey: 'AIzaSyCfj2M2MCemWKgliVc0rqabrUE3LmBG2Fk',
    appId: '1:720129245242:web:8061295e0df1ea1eabf503',
    messagingSenderId: '720129245242',
    projectId: 'fir-todolist-81bd3',
    authDomain: 'fir-todolist-81bd3.firebaseapp.com',
    storageBucket: 'fir-todolist-81bd3.appspot.com',
    measurementId: 'G-4FPPDLEMGT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4wR9nAmZZy_Gv2ONLr4HV9REI-0RrX1Y',
    appId: '1:720129245242:android:cc8f387a62c2591eabf503',
    messagingSenderId: '720129245242',
    projectId: 'fir-todolist-81bd3',
    storageBucket: 'fir-todolist-81bd3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_Pc55YN3YeMrVFrBHcnXfzn53DqkanNU',
    appId: '1:720129245242:ios:c514bf34182d34acabf503',
    messagingSenderId: '720129245242',
    projectId: 'fir-todolist-81bd3',
    storageBucket: 'fir-todolist-81bd3.appspot.com',
    iosClientId: '720129245242-8dknvgv4jqrneifh5251330sk2a998nl.apps.googleusercontent.com',
    iosBundleId: 'Riverpod.todolist',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC_Pc55YN3YeMrVFrBHcnXfzn53DqkanNU',
    appId: '1:720129245242:ios:dba22fd722acbef4abf503',
    messagingSenderId: '720129245242',
    projectId: 'fir-todolist-81bd3',
    storageBucket: 'fir-todolist-81bd3.appspot.com',
    iosClientId: '720129245242-q2c4f4i3721k3tcad4t8l4m7t2gdlbu5.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseTodolistRiverpod',
  );
}
