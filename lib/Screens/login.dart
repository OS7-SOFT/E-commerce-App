import 'package:e_commerce_app/Models/DataModels/User.dart';
import 'package:e_commerce_app/Models/StateModels/FieldStateModel.dart';
import 'package:e_commerce_app/Models/StateModels/UserStateModel.dart';
import 'package:e_commerce_app/Screens/Home.dart';
import 'package:e_commerce_app/Screens/register.dart';
import 'package:e_commerce_app/Shared/customTextButton.dart';
import 'package:e_commerce_app/Shared/customTextFormField.dart';
import 'package:e_commerce_app/Shared/primaryButton.dart';
import 'package:e_commerce_app/Shared/headAuthenticateScreens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  bool _securePass = true;
  String? _email, _password;

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    var userState = Provider.of<UserStateModel>(context);
    var fieldState = Provider.of<FieldStateModel>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Head content
            HeadPage(title: "Login"),
            //Forms Content
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Form(
                    key: _formState,
                    child: Column(children: [
                      //Email
                      CustomTextFormField(
                        label: "Email",
                        autovalidate: AutovalidateMode.disabled,
                        onSaved: (val) {
                          _email = val;
                        },
                        validate: (val) {
                          return val?.trim() == "" ? "Email is required" : null;
                        },
                      ),
                      //Password
                      Selector<FieldStateModel, bool>(
                          selector: (context, field) => field.SecurePass,
                          builder: (context, _secure, _) {
                            return CustomTextFormField(
                              label: "Password",
                              validate: (val) {
                                return val?.trim() == ""
                                    ? "Password is required"
                                    : null;
                              },
                              onSaved: (val) => _password = val,
                              isPassword: true,
                              isSecure: _secure,
                              changeSecureMethod: fieldState.secureMethod,
                            );
                          })
                    ]),
                  ),
                ),
                //Login button
                PrimaryButton(
                    text: "Log in",
                    onPressed: () {
                      //login
                      if (_loginMethod(userState))
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Home()));
                      else
                        _messageDialog(context);
                    }),
              ],
            ),
            //create new account
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
                  CustomTextButton(
                      text: "Sign up",
                      size: 15,
                      colorDegree: 800,
                      onPressed: () {
                        //route to Register Screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Message Error
  Future<dynamic> _messageDialog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.error,
                color: Colors.red[500],
              ),
              SizedBox(
                width: 5,
              ),
              Text("Login failed")
            ],
          ),
          titleTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.red[500]),
          content: Text("Error in email or password !"),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Close"))
          ],
        );
      },
    );
  }

  //login method
  bool _loginMethod(UserStateModel modelState) {
    //users
    List<User> users = modelState.items;
    bool isExists = false;

    var formData = _formState.currentState;
    if (formData!.validate()) {
      formData.save();
      //Check if user is exists
      for (int i = 0; i < users.length; i++) {
        if (users[i].Email == _email && users[i].Password == _password) {
          //set user
          modelState.setUserLogged(users[i]);
          isExists = true;
          break;
        }
      }
    }
    return isExists;
  }
}
