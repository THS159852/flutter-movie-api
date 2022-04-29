import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:movie_app/src/signin/components/signin_form.dart';
class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            headerScreen(context),
            SignInForm(),
            footerScreen(context),
          ],
        ),
      ),
    ));
  }
}

// class Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: SingleChildScrollView(
//       child: Container(
//         child: Column(
//           children: [
//             headerScreen(context),
//             SignInForm(),
//             footerScreen(context),
//           ],
//         ),
//       ),
//     ));
//   }

  Widget headerScreen(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.2 ,
      alignment: Alignment.bottomRight,

    );
  }

  Widget footerScreen(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomLeft,

    );
  }







