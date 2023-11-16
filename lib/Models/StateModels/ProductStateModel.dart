import 'package:e_commerce_app/Models/DataModels/Product.dart';
import 'GenericStateModel.dart';

class ProductStateModel extends GenericStateModel<Product> {
  //increament sold after sold
  void increamentSold(int id) {
    items.firstWhere((product) => product.Id == id).Sold++;
    notifyListeners();
  }
}
