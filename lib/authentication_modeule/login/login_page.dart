import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:login_with_firebase/authentication_modeule/firebase_integration/methods/methods.dart';
import 'package:login_with_firebase/authentication_modeule/login/controller/login_controller.dart';
import 'package:login_with_firebase/authentication_modeule/signup/sign_in_page.dart';
import 'package:login_with_firebase/custom_widgets/custom_textform_widget.dart';
import 'package:login_with_firebase/widgets_screen/reset_password_widget_page.dart';
import 'package:login_with_firebase/widgets_screen/welcome_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void onInit() {
    // TODO: implement onInit
  }

  bool shouldPop = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        body: Container(
          width: w,
          child: SafeArea(
            child: SingleChildScrollView(
              child: GetBuilder<LoginController>(
                builder: (controller) => Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Welcome To Login page',
                      style: TextStyle(fontSize: 25, color: Colors.blueAccent),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
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
                            controller.email = value!;
                          },
                          validator: (value) {
                            return controller.validateEmail(value);
                          },
                          obscureText: false,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormWidget(
                          hintText: 'Password',
                          controller: passwordController,
                          icon: const Icon(Icons.lock, color: Colors.blue),
                          keyBoardType: TextInputType.text,
                          onSaved: (value) {
                            controller.password = value!;
                          },
                          validator: (value) {
                            return controller.validatePassword(value);
                          },
                          obscureText: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Get.to(()=>ResetPasswordWidgetPage());
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: 250,
                      child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          // bool isValid = controller.loginformKey.currentState!.validate();
                          // if (!isValid) {
                          //   return null;
                          // }
                          // controller.loginformKey.currentState!.save();

                          if (emailController.text.trim().isNotEmpty &&
                              passwordController.text.trim().isNotEmpty) {
                              setState(() {
                                isLoading = true;
                              });
                          }
                          logIn(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          ).then(
                                (user) {
                              if (user != null) {
                                setState(() {
                                  isLoading = false;
                                  print('Login Successfully');
                                });
                                if (user.emailVerified)
                                  Get.to(() => WelcomePage());
                              } else {
                                print("Login Failed");
                              }
                            },
                          );
                        },
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont have an account ?',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => SignInPageWidget());
                          },
                          child: const Text(
                            'Create an Account',
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                    const Text(
                      'Or',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SignInButton(
                            Buttons.Google,
                            mini: false,
                            onPressed: () {
                              loginwithgoogle();
                            },
                          ),
                          SignInButton(
                            Buttons.Facebook,
                            mini: true,
                            onPressed: () async {
                              loginWithFacebook();
                            },
                          ),
                          SignInButton(
                            Buttons.Apple,
                            mini: true,
                            onPressed: () async {
                              loginWithFacebook();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
