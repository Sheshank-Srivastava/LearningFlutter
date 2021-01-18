import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

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
  Map _countries = new Map();

  void _getData() async {
    _countries.clear();
    var url = 'http://country.io/names.json';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        _countries = json.decode(response.body);
        print('Loaded ${_countries.length} countries');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // _getData();
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
              new Text(
                'Countries',
                style: new TextStyle(fontWeight: FontWeight.bold),
              ),
              new Expanded(child: new ListView.builder(
                itemCount: _countries.length,
                itemBuilder: (BuildContext context, int index){
                  String key = _countries.keys.elementAt(index);
                  return new Row(
                    children: [
                      new Text('${key}:'),
                      new Text(_countries[key])
                    ],
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }
}
