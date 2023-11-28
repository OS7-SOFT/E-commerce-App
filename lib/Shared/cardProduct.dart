import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final String? imageUrl;
  final String? productName;
  final double? price;
  final VoidCallback onPressed;

  const CardProduct(
      {super.key,
      required this.productName,
      required this.imageUrl,
      required this.price,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      //Methode
      onPressed: onPressed,
      // Content
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 120,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/$imageUrl"))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 5),
              child: Text(
                "\$${price}",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            Text(
              "$productName",
              style: TextStyle(color: Colors.grey[700]),
            ),
          ]),
    );
  }
}
