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
    apiKey: 'AIzaSyBjb6RHicrLPNTKwjDoC3P0rfofuzpzZOA',
    appId: '1:35122444368:web:d6102639f1e297fbd0b955',
    messagingSenderId: '35122444368',
    projectId: 'movies-7b8dd',
    authDomain: 'movies-7b8dd.firebaseapp.com',
    storageBucket: 'movies-7b8dd.appspot.com',
    measurementId: 'G-XD5VEQJK5X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2jfybEIOx2EYj-nS_LpQgmtapYVQt0Mo',
    appId: '1:35122444368:android:d3f701b322b2e1fed0b955',
    messagingSenderId: '35122444368',
    projectId: 'movies-7b8dd',
    storageBucket: 'movies-7b8dd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPFmXWo4LTBStkqMtcklmy5usVGFz95UM',
    appId: '1:35122444368:ios:c82c12c102a2c20fd0b955',
    messagingSenderId: '35122444368',
    projectId: 'movies-7b8dd',
    storageBucket: 'movies-7b8dd.appspot.com',
    iosBundleId: 'com.example.moviesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDPFmXWo4LTBStkqMtcklmy5usVGFz95UM',
    appId: '1:35122444368:ios:68ffa7bb881ad63fd0b955',
    messagingSenderId: '35122444368',
    projectId: 'movies-7b8dd',
    storageBucket: 'movies-7b8dd.appspot.com',
    iosBundleId: 'com.example.moviesApp.RunnerTests',
  );
}
