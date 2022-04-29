import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/src/signup/components/signup_form.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Register Account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple, height: 1.5),),
            Text(
              "Complete your details or continue \nor with social media",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFFA4A4BF)),
            ),
            SignUpForm()
          ],
        ),),
    ));
  }
}

// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Container(
//       width: MediaQuery.of(context).size.width,
//       child: Padding(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             Text("Register Account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple, height: 1.5),),
//             Text(
//               "Complete your details or continue \nor with social media",
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Color(0xFFA4A4BF)),
//             ),
//             SignUpForm()
//           ],
//         ),),
//     ));
//   }
// }
