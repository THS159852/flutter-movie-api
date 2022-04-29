import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/src/signin/signinpage.dart';
import 'package:movie_app/src/ui/home_screen.dart';
import 'package:movie_app/routes.dart';

class SplashPage extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    new Future.delayed(new Duration(seconds: 3), () {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignInPage(),), (route) => false);
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.black45
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 5,
              ),
              SizedBox(height: 5,),
              Text('Loading...', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),)
            ],
          ) ,),
      ),
    );
  }
}
