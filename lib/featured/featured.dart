import 'dart:ffi';

import 'package:e_commerce_app/design/customCard.dart';
import 'package:flutter/material.dart';

class FeaturedPage extends StatefulWidget {
  const FeaturedPage({super.key});

  @override
  State<FeaturedPage> createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 250, 250),
        shadowColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          hoverColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 109, 109, 109),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              hoverColor: Colors.transparent,
              icon: Icon(Icons.search,
                  color: const Color.fromARGB(255, 109, 109, 109))),
          IconButton(
              onPressed: () {},
              hoverColor: Colors.transparent,
              icon: Icon(Icons.notifications_active_outlined,
                  color: const Color.fromARGB(255, 109, 109, 109))),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body:Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            
            child: Column(
              children: [
                //Title
                Row(
                  children: [
                    Text(
                      "Featured",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 26,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                //List Products
                GridView(
          
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20,mainAxisSpacing: 20),
                  shrinkWrap: true,

                  children: [
                   CustomCard(productName: "Woman T-shirt", salary: "55.00", imgUrl: "Image 6.png"),
                   CustomCard(productName: "Woman T-shirt", salary: "55.00", imgUrl: "Image 13.png"),
                   CustomCard(productName: "Woman T-shirt", salary: "55.00", imgUrl: "Image 7.png"),
                   CustomCard(productName: "Woman T-shirt", salary: "55.00", imgUrl: "Image 11.png"),
                   CustomCard(productName: "Woman T-shirt", salary: "55.00", imgUrl: "Image 5.png"),
                   CustomCard(productName: "Woman T-shirt", salary: "55.00", imgUrl: "Image 8.png"),
                   CustomCard(productName: "Woman T-shirt", salary: "55.00", imgUrl: "Image 9.png"),
                   CustomCard(productName: "Woman T-shirt", salary: "55.00", imgUrl: "Image 7.png"),
                   CustomCard(productName: "Woman T-shirt", salary: "55.00", imgUrl: "Image 13.png"),
                   CustomCard(productName: "Woman T-shirt", salary: "55.00", imgUrl: "Image 6.png"),
                  ],
                )
          
          
              ],
            ),
          )),
    );
  }
}
