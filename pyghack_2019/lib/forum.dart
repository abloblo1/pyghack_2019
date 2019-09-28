import 'package:flutter/material.dart';
import 'search.dart';

class ForumBase extends StatefulWidget {
  ForumBase({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ForumBaseState();
  }
}

class _ForumBaseState extends State<ForumBase> {
  var test = new Center (
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: Colors.pink,
        width: 48.0,
        height: 48.0,
      ),
  );
  @override
  Widget build(BuildContext build) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Forum'),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.all(5.0),
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
              );
            },
          )
        ],
      ),
      body: new Container (
          child: test
      ),
    );
  }
}