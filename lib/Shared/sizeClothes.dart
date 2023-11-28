import 'package:flutter/material.dart';

class SizeButton extends StatefulWidget {
  final String sizeText;
  const SizeButton({super.key, required this.sizeText});

  @override
  State<SizeButton> createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    //Animate change color
    _colorAnimation =
        ColorTween(begin: Colors.grey[300], end: Color(0xff667fea))
            .animate(_controller);

    //Listener status
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isSelected = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isSelected = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return InkWell(
          onTap: () {
            isSelected ? _controller.reverse() : _controller.forward();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: _colorAnimation.value,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "${widget.sizeText}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
