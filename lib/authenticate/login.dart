import 'package:e_commerce_app/design/customButton.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //accounts lists
  var accounts = [
    {"name":"Osama","email": "os1213@gmail.com", "pass": "123456"},
    {"name":"Salem","email": "os1213@gmail.com", "pass": "123456"},
    {"name":"Osman","email": "osama@gmail.com", "pass": "123456"},
    {"name":"Mazen","email": "os@gmail.com", "pass": "123456"},
    {"name":"Arwa","email": "os77@gmail.com", "pass": "123456"}
  ];

  GlobalKey<FormState> formState = new GlobalKey<FormState>();
  bool securePass = true;
  var email, password;

  //login method
  loginMethod() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      accounts.forEach((account) {
        if (account["email"] == email && account["pass"] == password) {
          print("login Successed");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            //arrow back and title
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(children: [
                Row(
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("present");
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                        )),
                  ],
                ),
                Row(children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ])
              ]),
            ),
            //Container for Forms
            Container(
              margin: EdgeInsets.only(bottom: 50, top: 45),
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: formState,
                child: Column(children: [
                  //Email
                  TextFormField(
                    onSaved: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    validator: (val) {
                      return val?.trim() == "" ? "Email is required" : null;
                    },
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 170, 170, 170)),
                        contentPadding: EdgeInsets.symmetric(vertical: 15)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Password
                  TextFormField(
                    onSaved: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    validator: (val) {
                      return val?.trim() == "" ? "Password is required" : null;
                    },
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 170, 170, 170)),
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
            //Login button
            CustomButton(
                text: "Log in",
                onPressed: () {
                  loginMethod();
                }),
            //move to create new account
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 126, 126, 126)),
                  ),
                  TextButton(
                      onPressed: () {
                         Navigator.of(context).pushReplacementNamed("register");
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
