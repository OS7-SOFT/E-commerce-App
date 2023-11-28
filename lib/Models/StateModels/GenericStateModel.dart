import 'package:flutter/material.dart';

class GenericStateModel<T> extends ChangeNotifier {
  
  //Get All items
  List<T> items = [];
  
  //Get Count
  int get count => items.length;

  //Set all data
  void setItems(List<T> items) {
    this.items = items;
    notifyListeners();
  }

  //Add
  void add(T item) {
    items.add(item);
    notifyListeners();
  }

  //Update
  void update(T oldItem, T newItem) {
    var index = items.indexOf(oldItem);
    if (index != -1) items[index] = newItem;
    notifyListeners();
  }

  //Delete
  void delete(T item) {
    items.remove(item);
    notifyListeners();
  }
}
