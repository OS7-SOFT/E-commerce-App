import 'package:e_commerce_app/Models/DataModels/Product.dart';
import 'package:e_commerce_app/Models/StateModels/ProductStateModel.dart';
import 'package:e_commerce_app/Models/StateModels/UserStateModel.dart';
import 'package:e_commerce_app/Screens/Present.dart';
import 'package:e_commerce_app/Screens/ProductScreen.dart';
import 'package:e_commerce_app/Screens/ProductDetails.dart';
import 'package:e_commerce_app/Shared/CartButton.dart';
import 'package:e_commerce_app/Shared/SearchProduct.dart';
import 'package:e_commerce_app/Shared/cardProduct.dart';
import 'package:e_commerce_app/Shared/customIconButton.dart';
import 'package:e_commerce_app/Shared/customTextButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //Load all products
    context.read<ProductStateModel>().loadAllProducts();
    //Get user logged
    var user = context.read<UserStateModel>().getUserLogged;

    //Home Content
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData.fallback(),
          actions: [
            CartButton(),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //user info
              UserAccountsDrawerHeader(
                currentAccountPicture:
                    CircleAvatar(backgroundColor: Colors.brown),
                accountName: Text("${user.FullName}"),
                accountEmail: Text("${user.Email}"),
              ),
              //------------buttons-----------

              Column(
                children: [
                  //Shopping
                  _buildListTile(context, "Shopping", Icon(Icons.shop)),
                  //Logout
                  _buildListTile(context, "Log-out", Icon(Icons.logout)),
                  SizedBox(height: 10,)
                ],
              )
            ],
          ),
        ),
        //Body
        body: Column(
          children: <Widget>[
            //Search
            _searchWidget(context),
            //Feature Products
            _headSection(context, "Featured"),
            Selector<ProductStateModel, List<Product>>(
              selector: (_, product) => product.getFeature,
              builder: (_, product, child) {
                return _buildCardProducts(product);
              },
            ),
            //Best Products
            _headSection(context, "Best Sell"),
            Selector<ProductStateModel, List<Product>>(
              selector: (_, product) => product.getBestSell,
              builder: (_, product, child) {
                return _buildCardProducts(product);
              },
            ),
          ],
        ));
  }

  //build list tile
  ListTile _buildListTile(BuildContext context, String title, Icon icon) {
    return ListTile(
        title: Text(
          "$title",
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600]),
        ),
        leading: icon,
        onTap: () {
          title == "Log-out"
              ? Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Present()))
              : Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ProductScreen()));
        });
  }

  //build head section title
  Container _headSection(BuildContext context, title) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            "$title",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700]),
          ),
          Spacer(),
          CustomTextButton(
              text: "See all",
              size: 15,
              colorDegree: 500,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProductScreen()));
              })
        ],
      ),
    );
  }

  //build search widget
  Container _searchWidget(BuildContext context) {
    String searchValue = "";

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 10,
                  color: Color.fromARGB(34, 0, 0, 0),
                  offset: Offset(0, 8))
            ]),
        child: TextFormField(
            onChanged: (val) => searchValue = val,
            decoration: InputDecoration(
              hintText: "Search Your Product",
              hintStyle: TextStyle(fontSize: 17, color: Colors.grey[500]),
              prefixIcon: CustomIconButton(
                icons: Icon(Icons.search),
                onPressed: () {
                  print("$searchValue");
                  showSearch(
                      context: context,
                      delegate: SearchProduct(),
                      query: searchValue);
                },
              ),
              border: InputBorder.none,
            )));
  }

  //build listView
  Widget _buildCardProducts(List<Product> products) {
    return Container(
      height: 200,
      //ListView builder
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          //Card Product
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CardProduct(
              productName: products[index].Name,
              imageUrl: products[index].ImageUrl,
              price: products[index].Price,
              onPressed: () {
                context
                    .read<ProductStateModel>()
                    .setProductSelected(products[index]);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProductDetails()));
              },
            ),
          );
        },
      ),
    );
  }
}
