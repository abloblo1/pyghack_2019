import 'package:flutter/material.dart';
class DataVisualization extends StatefulWidget {
  @override
  Visualization createState() => Visualization();
}

class Visualization extends State<DataVisualization> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
      const RaisedButton(
      onPressed: null,
        child: Text(
            'Read Data',
            style: TextStyle(fontSize: 20)
        ),
      ),
  ]
  )
    );
}
}