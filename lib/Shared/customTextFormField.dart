import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final bool isSecure;
  final bool isPassword;
  final VoidCallback? changeSecureMethod;
  final String? Function(String?) validate;
  final Function(String?) onSaved;
  final Function(String?)? onChanged;
  final AutovalidateMode? autovalidate;

  const CustomTextFormField(
      {super.key,
      required this.label,
      this.isSecure = false,
      this.isPassword = false,
      this.changeSecureMethod,
      required this.validate,
      required this.onSaved,
      this.onChanged,
      this.autovalidate});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(color: Colors.grey[500]),
          contentPadding: EdgeInsets.all(0),
          suffix: widget.isPassword ? IconShowPassword(widget.changeSecureMethod) : null),
      validator: widget.validate,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      autovalidateMode: widget.autovalidate,
      obscureText: widget.isSecure,
    );
  }
}

Widget IconShowPassword(action) {
  return IconButton(
      onPressed: action,
      icon: Icon(
        Icons.remove_red_eye,
        size: 20,
      ));
}
