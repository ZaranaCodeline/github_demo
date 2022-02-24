import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = '';
  var password = '';
  var name = '';

  GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  Map<String, String> formFeild = Map<String,String>();

  String? validateEmail(String value) {
    // if (!GetUtils.isEmail(value)) {
    //   return "Provide valid Email";
    // } else {
    //   return null;
    // }
    if(value.isEmpty) return "E-mail address is required";
    String pattern = r'w+@\w+\.w+';
    RegExp regExp = RegExp(pattern);
    if(!regExp.hasMatch(value)) return "Invalid Email addrees format";
    return null;
  }

  String? validatePassword(String value) {
    if(value.isEmpty) return "E-mail address is required";

    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$*~]).{8,}$';
    RegExp regExp = RegExp(pattern);

    if (value.length < 8) {
      return "Password must be of 6 charecters";
    } else if(!regExp.hasMatch(value)){
      return '''password must be at least last 8 character ,
      include an uppercase and lowercase letter, number,symbol
          ''';
    }
    return null;
  }

  void checkLogin() {
    bool isValid = loginformKey.currentState!.validate();
    if (!isValid) {
      return null;
    }
    loginformKey.currentState!.save();
  }
}
