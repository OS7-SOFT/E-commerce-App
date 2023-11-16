import 'package:e_commerce_app/Screens/login.dart';
import 'package:e_commerce_app/Screens/register.dart';
import 'package:e_commerce_app/Shared/customTextButton.dart';
import 'package:e_commerce_app/Shared/primaryButton.dart';
import 'package:flutter/material.dart';

class Present extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //Title
              titleScreen(),
              //image
              TweenAnimationBuilder(
                  duration: Duration(milliseconds: 1000),
                  tween: Tween<double>(begin: 0, end: 1),
                  builder: (context, _val, child) {
                    return Opacity(
                      opacity: _val,
                      child: child,
                    );
                  },
                  child: Image(
                    image: AssetImage("images/present.png"),
                    width: 330,
                  )),
              //Buttons
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Column(
                  children: [
                    //Login
                    PrimaryButton(
                        text: "Login",
                        onPressed: () {
                          //route to login screen
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        }),
                    SizedBox(
                      height: 15,
                    ),
                    //sign up
                    CustomTextButton(
                        text: "Sign up",
                        size: 16,
                        colorDegree: 700,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        }),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  //Animate Title page
  TweenAnimationBuilder<double> titleScreen() {
    return TweenAnimationBuilder(
        child: Column(children: [
          Text(
            "Welcome to App",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700]),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Explore Us",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey),
          )
        ]),
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(milliseconds: 1000),
        curve: Curves.bounceOut,
        builder: (BuildContext context, double _val, child) {
          return Opacity(
            opacity: _val,
            child: Container(
              height: 150,
              padding: EdgeInsets.only(top: _val * 50),
              child: child,
            ),
          );
        });
  }
}
