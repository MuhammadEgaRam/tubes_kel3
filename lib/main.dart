import 'package:flutter/material.dart';
import 'package:tubes_kel3/routes/route.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyD8GLi-Muna9NUpa10BOojP1UHFxGCE5IM',
          appId: '1:772178293651:android:949db87bcd722d70c22e66',
          messagingSenderId: '772178293651',
          projectId: 'ocr-mobile-6035f',
          storageBucket: 'ocr-mobile-6035f.appspot.com'),
    );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scanner',
      initialRoute: Routes.splash, // Rute awal aplikasi
      routes: Routes.routes,
    );
  }
}
