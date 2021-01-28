import 'package:flutter/material.dart';



class Third extends StatefulWidget {
  @override
  _ThirdState createState() => new _ThirdState();
}

class _ThirdState extends State<Third> {

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
              new Text('Third pages'),
              // new RaisedButton(onPressed: ()=>{Navigator.of(context).pushNamed('/Home')}, child: new Text("Next"),),
              new RaisedButton(onPressed: ()=>{Navigator.of(context).pushNamed('/Second')}, child: new Text("Back"),)
            ],
          ),
        ),
      ),
    );
  }
}
