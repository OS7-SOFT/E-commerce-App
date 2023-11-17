import 'package:e_commerce_app/Models/AccountsList.dart';
import 'package:e_commerce_app/Models/DataModels/User.dart';
import 'package:e_commerce_app/Models/StateModels/FieldStateModel.dart';
import 'package:e_commerce_app/Models/StateModels/UserStateModel.dart';
import 'package:e_commerce_app/Screens/Present.dart';
import 'package:e_commerce_app/Screens/register.dart';
import 'package:e_commerce_app/Shared/customTextButton.dart';
import 'package:e_commerce_app/Shared/customTextFormField.dart';
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
  String? email, password;

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
            headBuild(context),
            //Forms Content
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Form(
                    key: formState,
                    child: Column(children: [
                      //Email
                      CustomTextFormField(
                        label: "Email",
                        autovalidate: AutovalidateMode.disabled,
                        onSaved: (val) {
                          email = val;
                        },
                        validate: (val) {
                          return val?.trim() == "" ? "Email is required" : null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //Password
                      Selector<FieldStateModel,bool>(
                        selector: (context,field)=> field.SecurePass,
                        builder: (context,_secure,_) {
                          return CustomTextFormField(
                            label: "Password",
                            validate: (val) {
                              return val?.trim() == ""
                                  ? "Password is required"
                                  : null;
                            },
                            onSaved: (val) => password = val,
                            isPassword: true,
                            isSecure: _secure,
                            changeSecureMethod: fieldState.secureMethod,
                          );
                        }
                      )
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
                      loginMethod(userState.data);
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

  //Build title and arrow
  Container headBuild(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        IconButton(
            padding: EdgeInsets.zero,
            hoverColor: Colors.transparent,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Present()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            )),
        Text(
          "Login",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ]),
    );
  }

  //Message Error 
  Future<dynamic> MessageDialog() {
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
            TextButton(onPressed: ()=>Navigator.of(context).pop(), child: Text("Close"))
          ],
        );
      },
    );
  }

  //login method
  void loginMethod(List<User> users) {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      //Check if user is exists
      bool isExists = false;
      for (int i = 0; i < users.length; i++) {
        if (users[i].Email == email && users[i].Password == password) {
          print("Done");
          isExists = true;
          break;
        }
      }
      isExists == false ? MessageDialog() : null;
    }
  }
}
