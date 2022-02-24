import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<User?> createAccount(String name, String email, String password) async {
  print('FIREBASE');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim()))
        .user;
    if (user != null) {
      print('Account created successfully');
      return user;
    } else {
      print('Account creation failed');
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print('Login created successfully');
      return user;
    } else {
      print('Login created successfully');
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future logOut() async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    _auth.signOut();
  } catch (e) {
    print(e);
    print("error");
  }
}

Future<bool?> loginwithgoogle() async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    GoogleSignIn googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, // accessToken
      idToken: googleAuth.idToken,
    );
    User? users = (await _auth.signInWithCredential(credential)).user;
    if (users == null) {
      return false;
    }
    return true;
  } catch (e) {
    print('this is error .......$e');
    return null;
  }
}

loginWithFacebook() async {
  var result = await FacebookAuth.i.login(permissions: [
    FacebookPermission.publicProfile.toString(),
    FacebookPermission.email.toString()
  ]);
  if (result.status == LoginStatus.success) {
    // Create a credential from the access token
    final OAuthCredential credential =
    FacebookAuthProvider.credential(result.accessToken!.token);
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

signInWithFacebook() async {
  final LoginResult result = await FacebookAuth.instance.login();
  if (result.status == LoginStatus.success) {
    // Create a credential from the access token
    final OAuthCredential credential =
        FacebookAuthProvider.credential(result.accessToken!.token);
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  return null;
}

