import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({required this.text, required this.onPressed});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
