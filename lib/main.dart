import 'package:flutter/material.dart';
import 'dart:async';
void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

enum Answer { YES, NO, MAYBE }

class _State extends State<MyApp> {
  String _value = '';

  void _setValue(String value) => setState(() => _value = value);

  Future _askUser()async{
    switch(
    await showDialog(context: context,
    child: new SimpleDialog(
      title: new Text('Do you like Flutter?'),
      children: [
        new SimpleDialogOption(child: new Text('YES!'),onPressed: (){
          Navigator.pop(context,Answer.YES);
        },),new SimpleDialogOption(child: new Text('NO'),onPressed: (){
          Navigator.pop(context,Answer.NO);
        },),new SimpleDialogOption(child: new Text('MAYBE!'),onPressed: (){
          Navigator.pop(context,Answer.MAYBE);
        },)
      ],
    ))
    ){
      case Answer.YES:
        _setValue('Yes');
        break;
      case Answer.NO:
        _setValue('No');
        break;
      case Answer.MAYBE:
        _setValue('Maybe');
        break;

    }
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
            children: <Widget>[new Text(_value),
            new RaisedButton(onPressed: _askUser,child: new Text('Click Me'),)],
          ),
        ),
      ),
    );
  }
}
