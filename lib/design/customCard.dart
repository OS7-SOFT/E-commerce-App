import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String productName;
  final String salary;
  final String imgUrl;

  const CustomCard(
      {required this.productName, required this.salary, required this.imgUrl});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                    image: AssetImage("images/${widget.imgUrl}"),
                    fit: BoxFit.cover)),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5,),
                child: Text(
                  "\$ ${widget.salary}",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color.fromARGB(155, 0, 0, 0)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              
                TextButton(
                  onPressed: (){},
                  child: Text(widget.productName,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color.fromARGB(155, 0, 0, 0))),
                ),
              
            ],
          ),
        ],
      ),
    );
  }
}
