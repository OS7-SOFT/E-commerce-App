import 'package:e_commerce_app/Models/DataModels/Product.dart';
import 'package:e_commerce_app/Models/StateModels/CartStateModel.dart';
import 'package:e_commerce_app/Models/StateModels/ProductStateModel.dart';
import 'package:e_commerce_app/Shared/CartButton.dart';
import 'package:e_commerce_app/Shared/sizeClothes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  @override
  Widget build(BuildContext context) {
    var product = context.read<ProductStateModel>().productSelected;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData.fallback(),
        actions: [
          CartButton(),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //Product Details
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //head info
                _headInfo(product, context),
                SizedBox(height: 20),
                _line(),
                //Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Text(
                    "${product.Descriptoin}",
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  ),
                ),
                _line(),
                //Select Size
                Center(
                  child: Text(
                    "Select Size",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[900]),
                  ),
                ),
                _line(),
                SizedBox(
                  height: 10,
                ),
                //Sizes buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizeButton(sizeText: "S"),
                    SizedBox(
                      width: 15,
                    ),
                    SizeButton(sizeText: "M"),
                    SizedBox(
                      width: 15,
                    ),
                    SizeButton(sizeText: "XL"),
                  ],
                )
              ]),
          //Button Add to cart
          Consumer<CartStateModel>(
            builder: (context, cart, _) {
              return Container(
                color: Colors.grey[300],
                child: TextButton(
                  onPressed: () {
                    //Add to cart
                    cart.add(product);
                    _messageSuccessed(context);
                    
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "ADD TO CART",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      )),
                ),
              );
            },
          )
        ],
      ),
    );
  }


  Divider _line() {
    return Divider(
      color: Colors.grey[700],
    );
  }
  //build head info 
  Container _headInfo(Product product, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //image
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                  color: Color.fromARGB(16, 0, 0, 0),
                  image: DecorationImage(
                      image: AssetImage("images/${product.ImageUrl}"))),
            ),
            SizedBox(
              height: 15,
            ),
            //Name
            Text(
              "${product.Name}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            //Price
            Text("\$${product.Price}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor)),
          ]),
    );
  }

  //Message Successed
  Future<dynamic> _messageSuccessed(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentTextStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
          content: Container(
            height: 110,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.done_all,
                  color: Colors.green[500],
                  size: 80,
                ),
                Text("Added Successfully"),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Close"))
          ],
        );
      },
    );
  }
}
