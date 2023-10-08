import 'package:e_commerce_app/design/customButton.dart';
import 'package:e_commerce_app/design/customTextField.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool securePass = true;
  var email,password;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey,
              )),
          Text(
            "Login",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          Container(
            margin:EdgeInsets.only(bottom: 50,top: 45) ,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  validator: (val) {
                    return val?.trim() == "" ? "Email is required" : null;
                  },
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 170, 170, 170)),
                      contentPadding: EdgeInsets.symmetric(vertical: 15)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (val) {
                    return val?.trim() == "" ? "Password is required" : null;
                  },
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 170, 170, 170)),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            securePass = !securePass;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye,
                            color: Colors.grey, size: 20),
                      )),
                  obscureText: securePass,
                ),
              
              ]),
            ),
          ),
          CustomButton(text: "Log in", onPressed: (){})
        ],
      ),
    );
  }
}
