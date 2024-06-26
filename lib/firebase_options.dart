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
    apiKey: 'AIzaSyD5qbdherUoFi-mI2rTmLq7ignhZtR8ruA',
    appId: '1:993166224200:web:aa2a0c28069cc8eba3217d',
    messagingSenderId: '993166224200',
    projectId: 'devmuscles-353ee',
    authDomain: 'devmuscles-353ee.firebaseapp.com',
    databaseURL: 'https://devmuscles-353ee-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'devmuscles-353ee.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvkY5AQ6EcxNEeVVn7k_qUv1dXeyc53v4',
    appId: '1:993166224200:android:dd513fbd0d065e23a3217d',
    messagingSenderId: '993166224200',
    projectId: 'devmuscles-353ee',
    databaseURL: 'https://devmuscles-353ee-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'devmuscles-353ee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsNpw7ua37ruEGyBatNJpPtwU1cgy8LoQ',
    appId: '1:993166224200:ios:31b612490218ea42a3217d',
    messagingSenderId: '993166224200',
    projectId: 'devmuscles-353ee',
    databaseURL: 'https://devmuscles-353ee-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'devmuscles-353ee.appspot.com',
    iosClientId: '993166224200-8qe3uk5i5r7pd52qrjh4mfjlpsrrvujp.apps.googleusercontent.com',
    iosBundleId: 'com.example.devMuscle',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsNpw7ua37ruEGyBatNJpPtwU1cgy8LoQ',
    appId: '1:993166224200:ios:31b612490218ea42a3217d',
    messagingSenderId: '993166224200',
    projectId: 'devmuscles-353ee',
    databaseURL: 'https://devmuscles-353ee-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'devmuscles-353ee.appspot.com',
    iosClientId: '993166224200-8qe3uk5i5r7pd52qrjh4mfjlpsrrvujp.apps.googleusercontent.com',
    iosBundleId: 'com.example.devMuscle',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD5qbdherUoFi-mI2rTmLq7ignhZtR8ruA',
    appId: '1:993166224200:web:5deb3d0599e02a7ca3217d',
    messagingSenderId: '993166224200',
    projectId: 'devmuscles-353ee',
    authDomain: 'devmuscles-353ee.firebaseapp.com',
    databaseURL: 'https://devmuscles-353ee-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'devmuscles-353ee.appspot.com',
  );

}