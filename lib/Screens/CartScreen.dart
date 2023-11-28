import 'dart:ffi';

import 'package:e_commerce_app/Models/DataModels/Product.dart';
import 'package:e_commerce_app/Models/StateModels/CartStateModel.dart';
import 'package:e_commerce_app/Shared/customIconButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        titleSpacing: 20,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData.fallback(),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Head section (Total Price)
            Container(
              width: double.infinity,
              child: Card(
                elevation: 10,
                color: Color.fromARGB(255, 253, 253, 253),
                margin: EdgeInsets.zero,
                child: Selector<CartStateModel, double>(
                  selector: (_, cart) => cart.totalPrice,
                  builder: (context, cart, _) {
                    return Container(
                        margin: EdgeInsets.only(left: 25, top: 10, bottom: 10),
                        child: Text(
                          "Total Price  :  \$$cart",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700]),
                        ));
                  },
                ),
              ),
            ),
            //card Product
            Consumer<CartStateModel>(
              builder: (context, cartModel, _) {
                print(cartModel.cartItems.length);
                return cartModel.cartItems.length < 1
                    ? Container(
                        margin: EdgeInsets.only(top: 100),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Icon(
                              Icons.remove_shopping_cart_outlined,
                              color: Colors.grey[500],
                              size: 50,
                            ),
                            SizedBox(height: 20,),
                            Text(
                              "No there any item in the cart",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    : Expanded(
                        //list builder
                        child: ListView.builder(
                          itemCount: cartModel.cartItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(top: 15),
                              child: _cardProduct(
                                  context,
                                  cartModel.cartItems[index]["product"],
                                  cartModel.cartItems[index]["quantity"]),
                            );
                          },
                        ),
                      );
              },
            ),
          ]),
    );
  }

  //build cart product
  Container _cardProduct(BuildContext context, Product product, int quantity) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //image
            Container(
              width: 110,
              height: 110,
              margin: EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/${product.ImageUrl}"),
                fit: BoxFit.cover,
              )),
            ),
            //Name & Price & counter
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: Text(
                    "${product.Name}",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                Text(
                  "\$${product.Price}",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor),
                ),
                //Counter
                Container(
                  width: 100,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //increase
                        InkWell(
                          onTap: () {
                            context
                                .read<CartStateModel>()
                                .decreaseQuantity(product.Id!);
                          },
                          child: Icon(Icons.remove, size: 17),
                        ),
                        //quantity
                        Text(
                          "${quantity}",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        //decrease
                        InkWell(
                          onTap: () {
                            context
                                .read<CartStateModel>()
                                .increaseQuantity(product.Id!);
                          },
                          child: Icon(Icons.add, size: 17),
                        )
                      ]),
                )
              ],
            ),
            Spacer(),
            //Button removed
            Consumer<CartStateModel>(
              builder: (context, cartModel, _) {
                return CustomIconButton(
                    icons: Icon(
                      Icons.close,
                      size: 22,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      cartModel.delete(product.Id!);
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
