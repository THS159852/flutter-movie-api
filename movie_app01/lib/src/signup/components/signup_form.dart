import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/src/model/user.dart';

import 'package:movie_app/src/signin/signinpage.dart';

import 'package:flutter_svg/svg.dart';
import 'package:movie_app/src/model/utilities.dart';
import 'package:quiver/strings.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conform = TextEditingController();
FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {


    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            emailTextFormField(),
            SizedBox(height: 30,),
            passwordTextFormField(),
            SizedBox(height: 30,),
            conformTextFormField(),
            SizedBox(height: 30,),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () async {
                 /* if(_formKey.currentState.validate()){
                     //Navigator.pop(context, User(username: email.text, password: conform.text));
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                  }*/

                if(password.text==conform.text) {
                  try {
                    UserCredential userCre = await firebaseAuth
                        .createUserWithEmailAndPassword(
                        email: email.text, password: password.text);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'email-already-in-use') {
                      print('Account already exists.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                  }
                  firebaseAuth.signOut();
                  if (firebaseAuth.currentUser != null) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  }

                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                }else{print('confirm password err.');}
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.deepPurple,
                child: Text("SignUp", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),),
            ),
            // SizedBox(height: 30,),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Container(
            //         height: 40,
            //         width: 40,
            //         padding: EdgeInsets.all(10),
            //         decoration: BoxDecoration(
            //             color: Color(0xFFF5F6F9),
            //             shape: BoxShape.circle
            //         ),
            //         child: SvgPicture.asset("assets/icons/facebook-2.svg"),
            //       ),
            //       Container(
            //         height: 40,
            //         width: 40,
            //         margin: EdgeInsets.only(left: 10, right: 10),
            //         padding: EdgeInsets.all(10),
            //         decoration: BoxDecoration(
            //             color: Color(0xFFF5F6F9),
            //             shape: BoxShape.circle
            //         ),
            //         child: SvgPicture.asset("assets/icons/google-icon.svg"),
            //       ),
            //       Container(
            //         height: 40,
            //         width: 40,
            //         padding: EdgeInsets.all(10),
            //         decoration: BoxDecoration(
            //             color: Color(0xFFF5F6F9),
            //             shape: BoxShape.circle
            //         ),
            //         child: SvgPicture.asset("assets/icons/twitter.svg"),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your email ",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)
      ),
      validator: Utilities.validateEmail,
      onSaved:(value){
        setState(() {
          email.text = value;
        });
      },
    );
  }



  TextFormField passwordTextFormField() {
    return TextFormField(
        key: _passKey,
        controller: password,
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter your password",
            // If  you are using latest version of flutter then lable text and hint text shown like this
            // if you r using flutter less then 1.20.* then maybe this is not working properly
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Icon(Icons.lock_outline)
        ),
        validator: (passwordKey){
          return Utilities.validatePassword(passwordKey);
        }
    );
  }

  TextFormField conformTextFormField() {
    return TextFormField(
      controller: conform,
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Re-enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)
      ),
      validator:  (conformPassword) {
        var pass = _passKey.currentState.value;
        return Utilities.conformPassword(conformPassword, pass);
      },
      onSaved: (value){
        setState(() {
          conform.text = value;
        });
      },
    );
  }



}

