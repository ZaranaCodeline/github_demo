import 'package:flutter/material.dart';

class SignOutPage extends StatelessWidget {
  const SignOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text('Sign Out'),
          ),
        ),
      ),
    );
  }
}
