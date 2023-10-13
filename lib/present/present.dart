import 'package:e_commerce_app/design/customButton.dart';
import 'package:flutter/material.dart';

class Present extends StatefulWidget {
  const Present({super.key});

  @override
  State<Present> createState() => _PresentState();
}

class _PresentState extends State<Present> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Welcome to App",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff707070))),
              ),
              Text("Explore Us",
                  style: TextStyle(fontSize: 18, color: Colors.grey))
            ],
          ),
          Container(
            width: 350,
            child: Image.asset("images/present.png"),
          ),
          Container(
            child: Column(children: [
              CustomButton(
                  text: "Log in",
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("login");
                  }),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("register");
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontSize: 16),
                  ),
                  textColor: const Color.fromARGB(255, 100, 100, 100),
                  hoverColor: Colors.transparent,
                ),
              )
            ]),
          )
        ],
      ),
    ));
  }
}
