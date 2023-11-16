import 'package:e_commerce_app/Models/AccountsList.dart';
import 'package:e_commerce_app/Models/DataModels/User.dart';
import 'package:e_commerce_app/Models/StateModels/UserStateModel.dart';
import 'package:e_commerce_app/Shared/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AccountList _accountList = AccountList();

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool securePass = true;
  var email, password;
  //login method
  loginMethod(List<User> users) {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      users.forEach((user) {
        if (user.Email == email && user.Password == password) {
          print("Done");
        } else {
          print("Failed");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var userState = Provider.of<UserStateModel>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          Consumer<UserStateModel>(
            builder: (context, user, child) {
              print("Build all form");
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 50, top: 45),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Form(
                      key: formState,
                      child: Column(children: [
                        //Email
                        TextFormField(
                          onSaved: (val) {
                              email = val;
                          },
                          validator: (val) {
                            return val?.trim() == ""
                                ? "Email is required"
                                : null;
                          },
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 170, 170, 170)),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 15)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //Password
                        Selector<UserStateModel, bool>(
                          selector: (context, secure) => user.SecurePass,
                          builder: (context, value, child) {
                            print("build Pass");
                            return TextFormField(
                              onSaved: (val) {
                                  password = val;
                              },
                              validator: (val) {
                                return val?.trim() == ""
                                    ? "Password is required"
                                    : null;
                              },
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 170, 170, 170)),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 15),
                                  suffix: IconButton(
                                    onPressed: () {
                                      context
                                          .read<UserStateModel>()
                                          .secureMethod();
                                    },
                                    icon: Icon(Icons.remove_red_eye,
                                        color: Colors.grey, size: 20),
                                  )),
                              obscureText: value,
                            );
                          },
                        ),
                      ]),
                    ),
                  ),
                  //Login button
                  PrimaryButton(
                      text: "Log in",
                      onPressed: () {
                        //load user data
                        context
                            .read<UserStateModel>()
                            .setItems(_accountList.accounts);
                        //login
                        loginMethod(user.data);
                      }),
                ],
              );
            },
          ),
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
    );
  }
}
