import 'package:e_commerce_app/Models/DataModels/Product.dart';
import 'package:flutter/material.dart';

class CartStateModel extends ChangeNotifier {
  double _totalPrice = 0;
  List<Map<String, dynamic>> _items = [];

  //Get Count product in cart
  int get count => _items.length;
  //Get total Price
  double get totalPrice => _totalPrice;
  //Get cart items
  List<Map<String, dynamic>> get cartItems => _items;

  //Add
  void add(Product product) {
    //Check product is Exist
    bool isExist = _items.any((ele) => ele["product"].Id == product.Id);
    if (!isExist) {
      _items.add({"product": product, "quantity": 1});
      _totalPrice += product.Price;
      notifyListeners();
    }
  }

  //Delete
  void delete(int id) {
    var currentItem = _items.firstWhere((ele) => ele["product"].Id == id);
    _items.remove(currentItem);
    _totalPrice -= currentItem["product"].Price * currentItem["quantity"];

    notifyListeners();
  }

  // increase Product quantity
  void increaseQuantity(int id) {
    var currentItem = _items.firstWhere((ele) => ele["product"].Id == id);
    currentItem["quantity"]++;
    _totalPrice += currentItem["product"].Price;
    notifyListeners();
  }

  // decrease Product quantity
  void decreaseQuantity(int id) {
    var currentItem = _items.firstWhere((ele) => ele["product"].Id == id);
    if (currentItem["quantity"] > 1) {
      currentItem["quantity"]--;
      _totalPrice -= currentItem["product"].Price;
      notifyListeners();
    }
  }
}
