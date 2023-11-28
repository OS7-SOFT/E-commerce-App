import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icons;
  final double? iconSize ;
  final VoidCallback onPressed;
  const CustomIconButton({super.key,required this.icons,this.iconSize,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    
    return IconButton(
      icon: icons,
      iconSize: iconSize,
      onPressed: onPressed,
      hoverColor: Colors.transparent,
    );
  }
}

