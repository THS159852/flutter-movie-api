// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/src/model/utilities.dart';
import 'package:movie_app/src/signup/signuppage.dart';
import 'package:movie_app/src/ui/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movie_app/src/model/user.dart';



class _HomeScreenState extends State<HomeScreen> {
// Thêm dòng này
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  var prefs;
  final _formKey = GlobalKey<FormState>();
  bool _value = false;
  final username = TextEditingController();
  final password = TextEditingController();
  _getData() async {
    prefs = await SharedPreferences.getInstance();
    if(!prefs.getString('username').isEmpty){
      username.text = prefs.getString('username');
      password.text = prefs.getString('password');
      _value = prefs.getBool('check');
      //print(_value.toString());
    }
  }
// Trong body của Scaffold
// Bọc Widget Center bằng FutureBuilder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }


          // Nếu thành công thì hiển thị như lúc đầu chúng ta đã tạo
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child:Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("TS-AMovies", style: TextStyle(fontSize: 32, color: Colors.deepPurple, fontWeight: FontWeight.bold),),
                          Text(
                            "Sign in with your email and password ",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFFA4A4BF)),

                          ),
                        ],
                      )),


                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            validator: (value){
                              return Utilities.validatePassword(value);
                            },
                            onSaved: (_value){
                              setState(() {
                                username.text = _value;
                              });
                            },
                            controller: username,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Username",
                                prefixIcon: Icon(Icons.mail_outline)
                            ),),
                          SizedBox(height: 5,),
                          TextFormField(
                            controller: password,
                            validator: (value){
                              return Utilities.validatePassword(value);
                            },
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock_outline_rounded)
                            ),),
                          SizedBox(height: 5,),
                          // Row(
                          //   children: [
                          //     Checkbox(value: _value?? : true, onChanged: (value)  {
                          //       print(_value.toString());
                          //       setState((){
                          //         _value = value;
                          //       });
                          //     }),
                          //     Text("Remember me", style: TextStyle(fontSize: 16, color: Colors.green),)
                          //   ],
                          // ),
                          SizedBox(height: 5,),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              onPressed: () async {
                                /*if(_value){
                                  // obtain shared preferences
                                  prefs = await SharedPreferences.getInstance();
                                  prefs.setString('username', username.text);
                                  prefs.setString('password', password.text);
                                  prefs.setBool('check', _value);

                                }else{
                                  prefs.remove('check');
                                }
*/
                                //Navigator.pushNamed(context,HomePage.routeName);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              color: Colors.purple,
                              child: Text("Log In", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account ? ", style: TextStyle(color: Colors.red, fontSize: 14),),
                              GestureDetector(
                                  onTap: ()  async {
                                    final result = await Navigator.pushNamed(context, SignUpPage.routeName);
                                    //User user = result;
                                    //username.text = user.username ;



                                  },
                                  child: Text(" Sign Up", style: TextStyle(color: Colors.yellow, fontSize: 14), ))

                            ],
                          )

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            );}
          // Đang load
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

