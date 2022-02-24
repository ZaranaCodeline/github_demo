import 'package:flutter/material.dart';

class CustomTextFormWidget extends StatelessWidget {
  CustomTextFormWidget(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.icon,
      this.keyBoardType, this.validator,required this.obscureText , required this.onSaved,})
      : super(key: key);

  final String? hintText;
  final Widget? icon;
  final TextInputType? keyBoardType;
  Function onSaved;
  dynamic validator;
  bool obscureText = false;

  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double  w = MediaQuery.of(context).size.width * 0.9;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: w,
        child: TextFormField(
          controller: controller,obscureText: obscureText,
          keyboardType: keyBoardType,
          validator: validator,
          decoration: InputDecoration(
            // labelText: 'lable',
            icon: icon,
            constraints: BoxConstraints(maxWidth: 300, minHeight: 50),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onSaved: onSaved as dynamic,
        ),
      ),
    );
  }
}
