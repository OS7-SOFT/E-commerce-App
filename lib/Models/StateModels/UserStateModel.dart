import 'package:e_commerce_app/Models/AccountsList.dart';
import 'package:e_commerce_app/Models/DataModels/User.dart';
import 'package:e_commerce_app/Models/StateModels/GenericStateModel.dart';

class UserStateModel extends GenericStateModel<User> {
  AccountList _accountList = AccountList();

  User _user = User();

  User get getUserLogged => _user;

  //set user is logged
  void setUserLogged(User user) {
    _user = user;
  }

  //Load all user
  void LoadAllAccounts() {
    items = _accountList.accounts;
  }
}
