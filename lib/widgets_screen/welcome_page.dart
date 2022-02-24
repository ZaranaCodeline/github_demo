import 'package:flutter/material.dart';
import 'package:login_with_firebase/authentication_modeule/firebase_integration/methods/methods.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TextButton(onPressed:() => logOut(),child: Text('LogOut'),)),
    );
  }
}
