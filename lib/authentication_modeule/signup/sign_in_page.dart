import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_with_firebase/authentication_modeule/firebase_integration/methods/methods.dart';
import 'package:login_with_firebase/authentication_modeule/login/controller/login_controller.dart';
import 'package:login_with_firebase/authentication_modeule/login/login_page.dart';
import 'package:login_with_firebase/authentication_modeule/signup/controller/sign_in_controller.dart';
import 'package:login_with_firebase/custom_widgets/custom_textform_widget.dart';
import 'package:login_with_firebase/custom_widgets/customr_textform_signin_widget.dart';
import 'package:login_with_firebase/firebase_authentication/authentification/controller/auth_controller.dart';

class SignInPageWidget extends StatefulWidget {
  SignInPageWidget({Key? key}) : super(key: key);

  @override
  State<SignInPageWidget> createState() => _SignInPageWidgetState();
}

class _SignInPageWidgetState extends State<SignInPageWidget> {
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();


  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool isLoading = false ;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var nameController = TextEditingController();

    var emailController = TextEditingController();

    var passwordController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: signInKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child:  isLoading
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Create an Account',
                        style:
                            TextStyle(fontSize: 25, color: Colors.blueAccent),
                      ),
                      SizedBox(height: 50),
                      Container(
                        alignment: Alignment.center,
                        child: GetBuilder<LoginController>(
                          builder: (controller) => Form(
                            child: Column(
                              children: [
                                CustomTextFormWidget(
                                  hintText: 'Enter Name',
                                  controller: nameController,
                                  icon: const Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                  ),
                                  keyBoardType: TextInputType.name,
                                  onSaved: (value) {
                                    controller.name = value!;
                                  },
                                  validator: (value) {
                                    return controller.validateEmail(value);
                                  },
                                  obscureText: false,
                                ),
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
                                CustomTextFormWidget(
                                  hintText: 'Password',
                                  controller: passwordController,
                                  icon: const Icon(Icons.lock,
                                      color: Colors.blue),
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
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Container(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          child: Text('Create an Account'),
                          style: ElevatedButton.styleFrom(),
                          onPressed: () {
                            if(signInKey.currentState!.validate()) {
                              signInKey.currentState!.save();
                              performLogin();
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextButton(
                          child: const Text('Login'),
                          onPressed: () {
                            Get.to(() => LoginPage());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
  void performLogin(){
    if ( nameController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      isLoading = true;
      createAccount(
          nameController.text.trim().toString(),
          emailController.text.trim().toString(),
          passwordController.text.trim().toString())
          .then((user) {
        if (user != null) {
          setState(() {
            isLoading = false;
            print('Login Successfully');
          });
        } else {
          print("Login Failed");
        }
      });
    } else {
      print('Enter Feild');
    }
  }
}
