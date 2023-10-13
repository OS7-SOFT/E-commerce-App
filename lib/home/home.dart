import 'package:e_commerce_app/design/customCard.dart';
import 'package:e_commerce_app/design/customTextButton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      //app bar
      appBar: AppBar(
        backgroundColor: Color(0xfffafafa),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu_rounded,
            color: Color.fromARGB(255, 88, 88, 88),
          ),
          hoverColor: Colors.transparent,
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: Color.fromARGB(255, 88, 88, 88),
              ),
              hoverColor: Colors.transparent),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_alt_outlined,
                color: Color.fromARGB(255, 88, 88, 88),
              ),
              hoverColor: Colors.transparent),
        ],
      ),
      drawer: Drawer(),
      body: Container(
        child: Column(
          children: [
            //search bar
            Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 7))
              ]),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Search Your Product",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none)),
              ),
            ),
            //Categories
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        CustomTextButton(text: "See all", onPressed: () {})
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20),
                    width: double.infinity,
                    height: 70,
                    child: //List Categories
                        ListView(scrollDirection: Axis.horizontal, children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage("images/present.png"),
                                fit: BoxFit.fill)),
                        child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "Woman",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage("images/present.png"),
                                fit: BoxFit.fill)),
                        child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 54, 67, 244)
                                    .withOpacity(0.4),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "Man",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage("images/present.png"),
                                fit: BoxFit.fill)),
                        child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 163, 41)
                                    .withOpacity(0.4),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "Kids",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ]),
                  )
                ],
              ),
            ),

            //Featured
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Featured",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        CustomTextButton(
                            text: "See all",
                            onPressed: () {
                              Navigator.of(context).pushNamed("featured");
                            })
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20),
                    width: double.infinity,
                    height: 160,
                    child: //List Features
                        ListView(scrollDirection: Axis.horizontal, children: [
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 110,
                          child: CustomCard(
                              productName: "Shirt",
                              salary: "23.00",
                              imgUrl: "Image 5.png")),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 110,
                          child: CustomCard(
                              productName: "Shirt",
                              salary: "23.00",
                              imgUrl: "Image 6.png")),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 110,
                          child: CustomCard(
                              productName: "Shirt",
                              salary: "23.00",
                              imgUrl: "Image 8.png")),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 110,
                          child: CustomCard(
                              productName: "Shirt",
                              salary: "23.00",
                              imgUrl: "Image 9.png")),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 110,
                          child: CustomCard(
                              productName: "Shirt",
                              salary: "23.00",
                              imgUrl: "Image 9.png")),
                    ]),
                  )
                ],
              ),
            ),

            //Best Sell
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Best Sell",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        CustomTextButton(text: "See all", onPressed: () {})
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20),
                    width: double.infinity,
                    height: 160,
                    child: //List Best Sell
                        ListView(scrollDirection: Axis.horizontal, children: [
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 110,
                          child: CustomCard(
                              productName: "Shirt",
                              salary: "23.00",
                              imgUrl: "Image 5.png")),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 110,
                          child: CustomCard(
                              productName: "Shirt",
                              salary: "23.00",
                              imgUrl: "Image 8.png")),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 110,
                          child: CustomCard(
                              productName: "Shirt",
                              salary: "23.00",
                              imgUrl: "Image 6.png")),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 110,
                          child: CustomCard(
                              productName: "Shirt",
                              salary: "23.00",
                              imgUrl: "Image 9.png")),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 110,
                          child: CustomCard(
                              productName: "Shirt",
                              salary: "23.00",
                              imgUrl: "Image 9.png")),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
