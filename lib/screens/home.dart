import 'package:demo_flutter/screens/second.dart';
import 'package:flutter/material.dart';
import 'package:demo_flutter/code/GlobaState.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _name;
  GlobalState _store = GlobalState.instance;

  @override
  void initState() {
    // TODO: implement initState
    _name = new TextEditingController();
    _store.set('name', '');
    _name.text = _store.get('name');
  }

  void _onPressed() {
    Navigator.push(context, new MaterialPageRoute(
        builder: (BuildContext context) => Second(_name.text),
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
              new TextField(
                controller: _name,
                decoration: new InputDecoration(labelText: 'Enter your name'),
              ),
              new RaisedButton(onPressed: _onPressed, child: new Text("Next"),),
            ],
          ),
        ),
      ),
    );
  }
}
