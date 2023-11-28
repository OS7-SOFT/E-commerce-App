import 'package:e_commerce_app/Models/DataModels/Product.dart';
import 'package:e_commerce_app/Models/ProductList.dart';
import 'GenericStateModel.dart';

class ProductStateModel extends GenericStateModel<Product> {
  ProductList _productList = ProductList();
  
  late Product _product;

  //get product selected
  Product get productSelected => _product;

 

  //Get best sell
  List<Product> get getBestSell {
    items.sort(((a, b) => b.Sold.compareTo(a.Sold)));
    return items.take(5).toList();
  }

  //Get Feature product
  List<Product> get getFeature {
    items.sort(((a, b) => b.Price.compareTo(a.Price)));
    return items.take(5).toList();
  }

  //loading products
  void loadAllProducts() {
    items = _productList.products;
  }

   //Set product selected
  void setProductSelected(Product product) {
    _product = product;
    notifyListeners();
  }

  //increament sold after sold
  void increamentSold(int id) {
    items.firstWhere((product) => product.Id == id).Sold++;
    notifyListeners();
  }
}
