import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

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
  String _status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    _status = 'Not Authenticated';
  }

  void _signInAnon() async {
    UserCredential user = await _auth.signInAnonymously();
    if (user != null && user.user.isAnonymous) {
      setState(() {
        _status = 'Signed in Anonymously';
      });
    } else {
      _status = 'Signed in Failed!';
    }
  }

  void _signOut() async {

    await _auth.signOut();
    setState((){
      _status = 'Signed Out';
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
            children: <Widget>[new Text(_status)
            ,new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new RaisedButton(onPressed: _signOut,child: new Text('SignOut'),),
                  new RaisedButton(onPressed: _signInAnon,child: new Text('Sign-in Anon'),),
                ],
              )],
          ),
        ),
      ),
    );
  }
}
