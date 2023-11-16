import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double size;
  final int colorDegree;
  const CustomTextButton(
      {super.key,
      required this.text,
      required this.size,
      required this.colorDegree,
      required this.onPressed});

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style:
            TextStyle(color: Colors.grey[widget.colorDegree], fontSize: widget.size),
      ),
    );
  }
}
