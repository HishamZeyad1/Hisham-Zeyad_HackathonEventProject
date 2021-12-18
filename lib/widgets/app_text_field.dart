import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
   AppTextField({
    Key? key,
    required this.hint,
    required this.controller,
     // this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,this.maxline=1
  }) : super(key: key);
  final String hint;
  final TextInputType keyboardType;
  final TextEditingController controller;
  // final IconData? prefixIcon;
  final bool obscureText;
  late int maxline;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,maxLines: this.maxline,
      decoration: InputDecoration(
        hintText: hint,
        // prefixIcon: Icon(prefixIcon),
        enabledBorder: border(),
        focusedBorder: border(borderColor: Colors.blue)
      ),
    );
  }

  OutlineInputBorder border({Color borderColor = Colors.grey}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
