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
  String _value = '';

  void _onClick(String value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name Here'),
        backgroundColor: Colors.pink,
      ),
      persistentFooterButtons: <Widget>[
        new IconButton(icon: new Icon(Icons.timer), onPressed: ()=>_onClick('Button 1'),),
        new IconButton(icon: new Icon(Icons.add), onPressed: ()=>_onClick('Button 2')),
        new IconButton(icon: new Icon(Icons.remove), onPressed: ()=>_onClick('Button 3')),
        new IconButton(icon: new Icon(Icons.people), onPressed: ()=>_onClick('Button 4'))
      ],
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[new Text(_value)],
          ),
        ),
      ),
    );
  }
}
