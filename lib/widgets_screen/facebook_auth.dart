import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class FaceBookLoginWidget extends StatefulWidget {
  const FaceBookLoginWidget({Key? key}) : super(key: key);

  @override
  _FaceBookLoginWidgetState createState() => _FaceBookLoginWidgetState();
}

class _FaceBookLoginWidgetState extends State<FaceBookLoginWidget> {
  bool isLoggedIn = false;
  late Map userProfile;
  final facebookLogin = FacebookLogin();

  loginWithFb() async {
    var result =
        await FacebookAuth.i.login(permissions: ["public_profile", "email"]);
    if (result.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i
          .getUserData(fields: "email,name,picture.type(large)");
    // this.u
    }
  }

  logOut() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook'),
      ),
      body: isLoggedIn
          ? Center(
              child: OutlinedButton(
                child: Text('LogOut'),
                onPressed: () {},
              ),
            )
          : Center(
              child: OutlinedButton(
                child: Text('Login with Facebook'),
                onPressed: () {},
              ),
            ),
    );
  }
}
