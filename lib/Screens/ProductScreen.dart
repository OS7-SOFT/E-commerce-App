import 'package:e_commerce_app/Models/DataModels/Product.dart';
import 'package:e_commerce_app/Models/StateModels/ProductStateModel.dart';
import 'package:e_commerce_app/Screens/Home.dart';
import 'package:e_commerce_app/Screens/ProductDetails.dart';
import 'package:e_commerce_app/Shared/CartButton.dart';
import 'package:e_commerce_app/Shared/SearchProduct.dart';
import 'package:e_commerce_app/Shared/cardProduct.dart';
import 'package:e_commerce_app/Shared/customIconButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
            icons: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()));
            }),
        title: Text(
          "Products",
          style: TextStyle(color: Colors.grey[800]),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        iconTheme: IconThemeData.fallback(),
        actions: [
          CustomIconButton(
              icons: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchProduct());
              }),
          CartButton(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      //Body Content
      body: Consumer<ProductStateModel>(builder: (_, productModel, child) {
        //Get all items
        List<Product> products = productModel.items;
        //grid view builder
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 220,
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(top: 20),
              child: CardProduct(
                productName: products[index].Name,
                imageUrl: products[index].ImageUrl,
                price: products[index].Price,
                onPressed: () {
                  productModel.setProductSelected(products[index]);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetails()));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
