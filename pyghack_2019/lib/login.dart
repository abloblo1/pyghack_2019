import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  loginPage createState() => new loginPage();
}

class loginPage extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: <Widget>[
      Center(
        child: new Image.asset(
          'assets/loginBg.png',
          width: size.width,
          height: size.height,
          fit: BoxFit.fill,
        ),
      ),
      Column(
        children: <Widget>[
          Container(
            child:
            Image.asset(
              'assets/welcomeSign.png',
              width: size.width,
              height: size.height/5,
            ),
          ),
          Text(
            "Please sign in to start using the app.If you have not yet made an account,please sign up!",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Times'),
          ),
        ],
      ),
    ]));
  }
}
