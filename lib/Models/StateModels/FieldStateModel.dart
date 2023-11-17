

import 'package:e_commerce_app/Models/StateModels/GenericStateModel.dart';
import 'package:flutter/material.dart';

class FieldStateModel extends ChangeNotifier {
   
  bool _securePass = true;
  bool get SecurePass => _securePass;

  void secureMethod() {
    _securePass = !_securePass;
    notifyListeners();
  }
}