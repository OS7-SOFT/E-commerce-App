import 'package:e_commerce_app/Models/StateModels/FieldStateModel.dart';
import 'package:e_commerce_app/Models/StateModels/UserStateModel.dart';
import 'package:e_commerce_app/Screens/login.dart';
import 'package:e_commerce_app/Shared/customTextFormField.dart';
import 'package:e_commerce_app/Shared/headAuthenticateScreens.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/Shared/primaryButton.dart';
import 'package:provider/provider.dart';

import '../Models/DataModels/User.dart';
import '../Shared/customTextButton.dart';
import 'Home.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  GlobalKey<FormState> _formState = new GlobalKey<FormState>();
  User _newUser = User();

  Register({super.key});

  @override
  Widget build(BuildContext context) {
    var userState = Provider.of<UserStateModel>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //head Screen
              HeadPage(title: "Signup"),
              //Form Content
              Consumer<UserStateModel>(
                builder: (context, value, _) => Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: Form(
                      key: _formState,
                      child: Column(
                        children: [
                          //full name field
                          CustomTextFormField(
                            label: "Full Name",
                            autovalidate: AutovalidateMode.onUserInteraction,
                            validate: (val) {
                              return val?.trim() == ""
                                  ? "Full name is required"
                                  : null;
                            },
                            onSaved: (val) => _newUser.FullName = val,
                          ),
                          //username field
                          CustomTextFormField(
                            label: "UserName",
                            autovalidate: AutovalidateMode.onUserInteraction,
                            validate: (val) =>
                                _checkUserName(userState.items, val),
                            onSaved: (val) => _newUser.Username = val,
                          ),
                          //email field
                          CustomTextFormField(
                            label: "Email",
                            autovalidate: AutovalidateMode.onUserInteraction,
                            validate: (val) {
                              return _checkEmail(val);
                            },
                            onSaved: (val) => _newUser.Email = val,
                          ),
                          //password field
                          Consumer<FieldStateModel>(
                              builder: (context, fieldState, _) {
                            return CustomTextFormField(
                              label: "Password",
                              isPassword: true,
                              isSecure: fieldState.SecurePass,
                              changeSecureMethod: fieldState.secureMethod,
                              autovalidate: AutovalidateMode.onUserInteraction,
                              validate: (val) => _checkPassword(val),
                              onSaved: (val) => _newUser.Password = val,
                            );
                          }),
                        ],
                      )),
                ),
              ),
              //Buttons
              PrimaryButton(
                  text: "Sign Up",
                  onPressed: () {
                    _registerMethod(userState, context);
                  }),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ?",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 126, 126, 126)),
                    ),
                    CustomTextButton(
                        text: "Sign in",
                        size: 15,
                        colorDegree: 800,
                        onPressed: () {
                          //route to Register Screen
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        })
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  //register method
  void _registerMethod(UserStateModel userState, BuildContext context) {
    var formData = _formState.currentState;
    if (formData!.validate()) {
      formData.save();
      _newUser.Id = userState.items.length + 1;
      //add user
      userState.add(_newUser);
      //set user 
      userState.setUserLogged(_newUser);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  //Check password
  String? _checkPassword(val) {
    if (val.trim() == "") return "Password is required";
    return val.trim().length <= 4
        ? "Password must be larg more than 4 charactar"
        : null;
  }

  //Check email
  String? _checkEmail(val) {
    if (val.trim() == "") return "Email is required";

    return val.endsWith("@gmail.com")
        ? null
        : "email syantex is uncorrect\n(Must be end with @gmail.com)";
  }

  //Check username if exists
  String? _checkUserName(List<User> users, val) {
    if (val.trim() == "") return "Username is required";

    bool isExist = false;

    for (int i = 0; i < users.length; i++) {
      if (users[i].Username == val.trim()) isExist = true;
    }

    return isExist == true ? "this username is already exists" : null;
  }
}
