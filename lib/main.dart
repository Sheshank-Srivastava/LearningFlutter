import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

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

  void _showUrl() {
    _launch('https://www.google.com');
  }

  void _showEmail() {
    _launch('mailto:sheshank281198@gmail.com');
  }

  void _showSMS() {
    _launch('sms:9350164795');

  }

  void _showTelephone() {
    _launch('tel:9350164795');
  }

  void _launch(String urlString) async {
    if(await canLaunch(urlString)){
      await launch(urlString);
    }else{
      throw 'Could not launch';
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(onPressed: _showUrl, child: new Text('URL')),
              new RaisedButton(onPressed: _showEmail, child: new Text('Email')),
              new RaisedButton(onPressed: _showSMS, child: new Text('SMS')),
              new RaisedButton(onPressed: _showTelephone, child: new Text('TelePhone')),
            ],
          ),
        ),
      ),
    );
  }
}
