import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                //image product
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 190,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("images/Image 14.png"))),
                ),
                //Title and price Product
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Black turtleneck top",
                      style: TextStyle(fontSize: 28, color: Colors.black87),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "\$42",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "\$62",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            Divider(
              color: Color.fromARGB(255, 184, 184, 184),
              height: 20,
              indent: 0,
            ),
            //Descriptoin
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "sections to the job description. Don’t use up too much of your space detailing daily duties that aren’t relevant to the job for which you’re applying. Study the job listing to figure out what’s most important to the hiring manager.",
                        style:
                            TextStyle(color: Color.fromARGB(255, 89, 88, 88)),
                      ),
                    )
                  ]),
            ),
            Divider(
              height: 1,
              color: Colors.black26,
              indent: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Select Size",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.black26,
              indent: 0,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                   color: Colors.grey,
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: InkWell(
                    splashColor: Theme.of(context).primaryColor,
                    onTap: () { },
                    child:  Text(
                      "S",
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
