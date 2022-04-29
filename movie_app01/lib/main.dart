import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/ui/home_screen.dart';
import 'package:movie_app/splashpage.dart';
import 'package:movie_app/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      // debugShowCheckedModeBanner: false,
      // home: splashpage(),
      initialRoute: SplashPage.routeName,
      routes: routes,
    );
  }
}



