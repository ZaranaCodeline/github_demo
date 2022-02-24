import 'package:flutter/material.dart';

class CustomTextFormSignInWidget extends StatelessWidget {
    CustomTextFormSignInWidget({Key? key , this.hintText}) : super(key: key);
String? hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1)),
          constraints: BoxConstraints(maxWidth: 300, minHeight: 50),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
