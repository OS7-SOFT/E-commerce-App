
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../design/customButton.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //accounts
  var accounts = [
    {"name": "osama", "email": "os1213@gmail.com", "pass": "123456"},
    {"name": "Salem", "email": "os1213@gmail.com", "pass": "123456"},
    {"name": "Osman", "email": "osama@gmail.com", "pass": "123456"},
    {"name": "Mazen", "email": "os@gmail.com", "pass": "123456"},
    {"name": "Arwa", "email": "os77@gmail.com", "pass": "123456"}
  ];

  GlobalKey<FormState> formState = new GlobalKey<FormState>();
  bool securePass = true;
  var name, email, password;

  //login method
  signUpMethod() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      accounts.add({"name": name, "email": email, "pass": password});
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
                    "Signup",
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
                  //Name Field
                  TextFormField(
                    onSaved: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val!.trim() == "")
                        return "Name field is required";
                      else {
                        //Check if user is already exist
                        for (int i = 0; i < accounts.length; i++) {
                          if (val.toLowerCase() ==
                              accounts[i]["name"]!.toLowerCase())
                            return "this name is already exists";
                        }
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 170, 170, 170)),
                        contentPadding: EdgeInsets.symmetric(vertical: 15)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Email Field
                  TextFormField(
                    onSaved: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val!.trim() == "")
                        return "Email is required";
                      else {
                        return val.endsWith("@gmail.com") == false
                            ? "email syntax uncorrect"
                            : null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 170, 170, 170)),
                        contentPadding: EdgeInsets.symmetric(vertical: 15)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Password Field
                  TextFormField(
                    onSaved: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val!.trim() == "") return "Passsword is requird";

                      return val.length < 6
                          ? "Password must be more than 6 character"
                          : null;
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
                text: "Sign Up",
                onPressed: () {
                  signUpMethod();
                }),
            //move to create new account
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ?",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 126, 126, 126)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("login");
                      },
                      child: Text(
                        "Sign in",
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
