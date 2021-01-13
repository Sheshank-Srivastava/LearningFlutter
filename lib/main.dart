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
  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(message),
          actions: [
            new FlatButton(
                onPressed: () => Navigator.pop(context), child: new Text('OK'))
          ],
        ));
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
              new Text('Hello World'),
              new RaisedButton(
                onPressed: () =>
                    _showAlert(context, 'Dou you like to Disable the message'),
                child: new Text('Click Me'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
