import 'package:e_commerce_app/Models/StateModels/CartStateModel.dart';
import 'package:e_commerce_app/Models/StateModels/FieldStateModel.dart';
import 'package:e_commerce_app/Models/StateModels/ProductStateModel.dart';
import 'package:e_commerce_app/Models/StateModels/UserStateModel.dart';
import 'package:e_commerce_app/Screens/Home.dart';
import 'package:e_commerce_app/Screens/Present.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductStateModel()),
        ChangeNotifierProvider(create: (_) => UserStateModel()),
        ChangeNotifierProvider(create: (_) => FieldStateModel()),
        ChangeNotifierProvider(create: (_) => CartStateModel()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
          theme: ThemeData(primaryColor: Color(0xff667fea))),
    );
  }
}

