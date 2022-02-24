import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_with_firebase/authentication_modeule/login/controller/login_controller.dart';
import 'package:login_with_firebase/authentication_modeule/signup/sign_in_page.dart';
import 'package:login_with_firebase/custom_widgets/custom_textform_widget.dart';

class ResetPasswordWidgetPage extends StatelessWidget {
  ResetPasswordWidgetPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Out'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormWidget(
                  hintText: 'Enter Email',
                  controller: emailController,
                  icon: const Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  keyBoardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    loginController.email = value!;
                  },
                  validator: (value) {
                    return loginController.validateEmail(value);
                  },
                  obscureText: false,
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(
                            email: emailController.text.trim())
                        .then((value) => Navigator.of(context).pop());
                  },
                  child: const Text(
                    'Reset Password',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
