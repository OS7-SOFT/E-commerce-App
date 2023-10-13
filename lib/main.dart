import 'package:e_commerce_app/Featured/featured.dart';
import 'package:e_commerce_app/authenticate/login.dart';
import 'package:e_commerce_app/authenticate/register.dart';
import 'package:e_commerce_app/home/home.dart';
import 'package:e_commerce_app/present/present.dart';
import 'package:e_commerce_app/productDetails/productDetails.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "present":(context) => Present(),
        "home":(context)=> HomePage(),
        "register":(context) => Register(),
        "login":(context) => Login(),
        "featured":(context) => FeaturedPage()
      },
      theme: ThemeData(
        primaryColor: Color(0xff667fea)
      )));
}
