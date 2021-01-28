import 'package:flutter/material.dart';

import  'package:demo_flutter/mywidget.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => new _SecondState();
}

class _SecondState extends State<Second> {

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name Here'),
        backgroundColor: Colors.pink,
      ),
      body: new Container(
        padding:  new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Welcome Second'),
              new RaisedButton(onPressed: ()=>{Navigator.of(context).pushNamedAndRemoveUntil('/Third',(Route<dynamic> route)=>false)}, child: new Text("Next"),),
              new RaisedButton(onPressed: ()=>{Navigator.of(context).pop()}, child: new Text("Back"),),
              new MyWidget()
            ],
          ),
        ),
      ),
    );
  }
}
