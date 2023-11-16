
import 'package:e_commerce_app/Models/DataModels/User.dart';
import 'package:e_commerce_app/Models/StateModels/GenericStateModel.dart';

class UserStateModel extends GenericStateModel<User> {
  bool _securePass = true;

  bool get SecurePass => _securePass;

  void secureMethod() {
    _securePass = !_securePass;
    notifyListeners();
  }
}
