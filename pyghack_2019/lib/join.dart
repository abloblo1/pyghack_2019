import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Join extends StatefulWidget {
  @override
  joinPage createState() => new joinPage();
}

class joinPage extends State<Join> {

  double opacity_joined = 0;
  double opacity_join = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child:
                Opacity(
                  opacity: opacity_joined,
                  child: Image.asset(
                    'assets/join_joined.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.fill,
                ),
                ),
              ),
              Container(
                child:
                Opacity(
                  opacity: opacity_join,
                  child:Image.asset(
                      'assets/join_join.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.fill,
              ),
                ),
            )
          ]),
            RaisedButton(
              child: Text("asdf"),
              onPressed: _changeImage,
              //width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height,

            )
        ]));
  }


  _changeImage() {
    setState(() {
      if (opacity_joined == 0) {
        opacity_joined = 1;
        opacity_join = 0;

      } else {
        opacity_joined = 0;
        opacity_join = 1;
      }
    });
  }
}