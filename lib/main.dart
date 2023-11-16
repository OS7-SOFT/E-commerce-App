import 'package:e_commerce_app/Models/StateModels/ProductStateModel.dart';
import 'package:e_commerce_app/Models/StateModels/UserStateModel.dart';
import 'package:e_commerce_app/Screens/Present.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ProductStateModel()),
        ChangeNotifierProvider(create: (context)=> UserStateModel()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Present(),
          theme: ThemeData(primaryColor: Color(0xff667fea))),
    );
  }
}


