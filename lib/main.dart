import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_with_firebase/authentication_modeule/login/controller/login_controller.dart';
import 'package:login_with_firebase/firebase_authentication/authentification/controller/auth_controller.dart';
import 'authentication_modeule/login/login_page.dart';
import 'authentication_modeule/signup/controller/sign_in_controller.dart';
import 'authentication_modeule/signup/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

   LoginController controller = Get.put(LoginController());
   SignInController signInController = Get.put(SignInController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home:   LoginPage(),
    );
  }

}

