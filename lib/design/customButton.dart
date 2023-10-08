import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        
        onPressed: () {
          setState(() {
            isPressed = !isPressed;
          });
          widget.onPressed;
        },
        child: Text(widget.text,style: TextStyle(fontSize: 20),),
      
      ),
    );
  }
}
