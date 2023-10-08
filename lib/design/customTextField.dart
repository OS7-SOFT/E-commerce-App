import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelTxt;
  final String inputVal;
  final VoidCallback validate;
  const CustomTextField(
      {super.key,
      required this.validate,
      required this.labelTxt,
      required this.inputVal});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (txt) {
        widget.validate;
      },
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
          labelText: widget.labelTxt,
          labelStyle: TextStyle(color: Color.fromARGB(255, 170, 170, 170)),
          contentPadding: EdgeInsets.symmetric(vertical: 15)),
    );
  }
}
