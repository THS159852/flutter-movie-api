import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/src/signin/signinpage.dart';
import 'package:movie_app/src/signup/components/body.dart';

class SignUpPage extends StatefulWidget {
  static String routeName;

  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            //Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInPage()));
          },
        ),
        centerTitle: true,
        title: Text("Sign Up", style: TextStyle(color: Colors.white),),),
      body: Body(),
    );
  }
}

// class SignUpPage extends StatelessWidget {
//   static String routeName = "/sign_up";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//
//         leading: IconButton(
//           color: Colors.white,
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: (){
//             Navigator.pop(context);
//           },
//         ),
//         centerTitle: true,
//         title: Text("Sign Up", style: TextStyle(color: Colors.white),),),
//       body: Body(),
//     );
//   }
// }
