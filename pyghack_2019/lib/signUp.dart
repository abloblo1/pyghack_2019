import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pyghack_2019/homePage.dart';


class SignUp extends StatefulWidget {
  @override
  signUpPage createState() => new signUpPage();
}

class signUpPage extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            child: Image.asset(
              'assets/signUpSign.png',
              width: size.width,
              height: size.height / 5,
            ),
          ),
          Text("       "),
          Text(
            "Fill out the fields below and then hit sign-up to begin using our app!",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Cochin'),
          ),
          Container(
            height: 50.0,
          ),
          new Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              width: 300.0,
              height: 400.0,
              decoration: new BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.75),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("Sign-up",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: "Blue Highway",
                          color: const Color(0xFFCE0009))),
                  Container(
                    height: 10.0,
                  ),
                  Text("Username:",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: "Cochin",
                      )),
                  TextField(),
                  Container(
                    height: 30.0,
                  ),
                  Text("Password:",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: "Cochin",
                      )),
                  TextField(),
                  Container(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {},
                        color: const Color(0xFFD1D2D4),
                        child: Text("Company",
                            style: TextStyle(fontFamily: "Cochin")),
                      ),
                      Container(
                        width: 10.0,
                      ),
                      Text("OR",
                          style: TextStyle(
                              color: Colors.red, fontFamily: "Cochin")),
                      Container(
                        width: 10.0,
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Text("User",
                            style: TextStyle(fontFamily: "Cochin")),
                      ),
                    ],
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 60.0,
                        ),
                        RaisedButton(
                            onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );},
                            color: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(color: const Color(0xFFCE0009)),
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Text("SIGN UP",
                                style: TextStyle(
                                    color: const Color(0xFFCE0009),
                                    fontFamily: "Blue Highway"))),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    ]));
  }
}
