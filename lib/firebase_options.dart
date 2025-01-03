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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAEJkM3JJl70l_5lpkYBDre_GWUirbqjk0',
    appId: '1:19310231666:android:9b1bb248f058b2571802eb',
    messagingSenderId: '19310231666',
    projectId: 'fruit-hub48',
    storageBucket: 'fruit-hub48.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJMAD9GGRvSk0M0JPUBn2VAUK5pAWmSpc',
    appId: '1:19310231666:ios:27c1360db8c7f8701802eb',
    messagingSenderId: '19310231666',
    projectId: 'fruit-hub48',
    storageBucket: 'fruit-hub48.firebasestorage.app',
    iosBundleId: 'com.example.commerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDBfIZJONxb-OCF-XKe63a5fwD5gf-ICOc',
    appId: '1:19310231666:web:ffa55b02e3052f871802eb',
    messagingSenderId: '19310231666',
    projectId: 'fruit-hub48',
    authDomain: 'fruit-hub48.firebaseapp.com',
    storageBucket: 'fruit-hub48.firebasestorage.app',
  );

}