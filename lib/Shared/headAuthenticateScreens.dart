import 'package:e_commerce_app/Screens/Present.dart';
import 'package:flutter/material.dart';

class HeadPage extends StatelessWidget {
  final String title;

  const HeadPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        IconButton(
            padding: EdgeInsets.zero,
            hoverColor: Colors.transparent,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Present()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            )),
        Text(
          "$title",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ]),
    );
  }
}
