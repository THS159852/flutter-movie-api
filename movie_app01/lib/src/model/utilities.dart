import 'dart:convert';
import "package:http/http.dart" as http ;
import 'package:convert/convert.dart';
import 'package:quiver/strings.dart';




class Utilities {

  static String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
  static String validatePassword(String value){
    if(value.isEmpty){
      return 'Please enter password';
    }
    if(value.length < 8){
      return 'Password should be more than 8 characters ';
    }
  }

  static String conformPassword(String value, String value2){
    if(!equalsIgnoreCase(value, value2))
      return "Conform password invalid";
  }

}
