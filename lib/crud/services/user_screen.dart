import 'package:flutter/material.dart';

class UserScreenPage extends StatelessWidget {
    UserScreenPage({Key? key ,required this.age, required this.userEmail,required this.userName}) : super(key: key);
    final  userName , userEmail;
    String age;
  @override
  Widget build(BuildContext context) {
    // var widget;
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      body: Container(
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(userName),
            Text(userEmail),
            Text(age),
          ],
        ),
      ),
    );
  }
}
