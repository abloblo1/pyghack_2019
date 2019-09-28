import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pyghack_2019/signUp.dart';
import 'package:pyghack_2019/homePage.dart';

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
            child: Image.asset(
              'assets/homeUserSign.png',
              width: size.width,
              height: size.height / 5,
            ),
          ),
          Text("       "),
          Text(
            "Please sign in to start using the app.If you have not yet made an account,please sign up!",
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
                  Text("Login",
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
                  Container(child: Column(
                    children: <Widget>[
                      RaisedButton(
                          onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );},
                          color: const Color(0xFFCE0009),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: Text("LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Blue Highway"))),
                      Container(height: 20.0,),
                      Divider(color:Colors.black,thickness: 1.0,),
                      Text(
                        "New User?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: "Cochin"),
                      ),

                      RaisedButton(
                          onPressed:() {  Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );},
                          color: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(side: BorderSide(color: const Color(0xFFCE0009)),
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: Text("SIGN UP",
                              style: TextStyle(
                                  color: const Color(0xFFCE0009),
                                  fontFamily: "Blue Highway"))),
                    ],
                  ),),
                ],
              )),
        ],
      ),
    ]));
  }
}
