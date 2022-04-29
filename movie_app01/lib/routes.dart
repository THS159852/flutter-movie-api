
import 'package:flutter/widgets.dart';
import 'package:movie_app/splashpage.dart';
import 'package:movie_app/src/signin/signinpage.dart';
import 'package:movie_app/src/signup/signuppage.dart';
import 'package:movie_app/src/ui/home_screen.dart';







final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName : (context) => SplashPage(),
  SignInPage.routeName : (context) => SignInPage(),
  SignUpPage.routeName : (context) => SignUpPage(),
  HomeScreen.routeName : (context) => HomeScreen(),
};