import 'package:e_commerce_app/Models/StateModels/CartStateModel.dart';
import 'package:e_commerce_app/Screens/CartScreen.dart';
import 'package:e_commerce_app/Shared/customIconButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CustomIconButton(
            icons: Icon(Icons.shopping_cart),
            onPressed: () {
              //route to cart screen
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartScreen()));
            }),
        Selector<CartStateModel, int>(
          selector: (_, cart) => cart.count,
          builder: (context, count, child) {
            if (count > 0) {
              return Container(
                width: 17,
                height: 17,
                margin: EdgeInsets.only(right: 20, bottom: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.red[500],
                    borderRadius: BorderRadius.circular(100)),
                child: Text(
                  "$count",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
              );
            }
            return Container();
          },
        )
      ],
    );
  }
}
