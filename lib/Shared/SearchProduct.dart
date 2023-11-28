
import 'package:e_commerce_app/Models/DataModels/Product.dart';
import 'package:e_commerce_app/Models/ProductList.dart';
import 'package:e_commerce_app/Models/StateModels/ProductStateModel.dart';
import 'package:e_commerce_app/Screens/ProductDetails.dart';
import 'package:e_commerce_app/Shared/customIconButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProduct extends SearchDelegate {
  ProductList productList = ProductList();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return CustomIconButton(
        icons: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> products = productList.products;
    List<Product> filter =
        products.where((value) => value.Name.toLowerCase().contains(query.toLowerCase())).toList();

    return query != ""
        ? ListView.builder(
            itemCount: filter.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTileBuild(context, index, filter);
            },
          )
        : ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTileBuild(context, index, products);
            },
          );
  }

  //list tile build
  Container ListTileBuild(
      BuildContext context, int index, List<Product> product) {
    return Container(
      width: double.infinity,
      child: ListTile(
        //name
        title: Text("${product[index].Name}"),
        //image
        leading: Image(
          image: AssetImage("images/${product[index].ImageUrl}"),
          width: 30,
          height: 30,
          fit: BoxFit.cover,
        ),
        onTap: () {
          print("object");
          //Select product
          context.read<ProductStateModel>().setProductSelected(product[index]);
          //route to product Details
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ProductDetails()));
        },
      ),
    );
  }
}
