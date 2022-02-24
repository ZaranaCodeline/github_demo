import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_with_firebase/authentication_modeule/login/login_page.dart';
import 'package:login_with_firebase/widgets_screen/welcome_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  //AuthController
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user wil be notify
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) async {
    if (user == null) {
      print("login page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => WelcomePage());
    }
  }

  void register(String email, password) async {
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        'About User',
        'User Message',
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text('Account creation failed'),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            fontSize: 20,
            // color: Colors.white,
          ),
        ),
      );
    }
  }
}
