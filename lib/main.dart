import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  void showBottom() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text(
                  'Some info here',
                  style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                new RaisedButton(onPressed: ()=> Navigator.pop(context),child: new Text('close'),)
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name Here'),
        backgroundColor: Colors.pink,
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Hello World') ,
              new RaisedButton(onPressed: showBottom,child: new Text('Click me'),)
            ],
          ),
        ),
      ),
    );
  }
}
