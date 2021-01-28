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
  double _x, _y, _z;

  @override
  void initState() {
    // TODO: implement initState
    _x = _y = _z = 0.0;
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
              new Row(
                children: [
                  new Text('X'),
                  new Slider(
                    value: _x,
                    onChanged: (double val) => setState(() {
                      _x = val;
                    }),
                  )
                ],
              ),
              new Row(
                children: [
                  new Text('Y'),
                  new Slider(
                    value: _y,
                    onChanged: (double val) => setState(() {
                      _y = val;
                    }),
                  )
                ],
              ),
              new Row(
                children: [
                  new Text('Z'),
                  new Slider(
                    value: _z,
                    onChanged: (double val) => setState(() {
                      _z = val;
                    }),
                  )
                ],
              ),
              new Transform(
                transform: new Matrix4.skewY(_y),
                child: new Transform(
                  transform: new Matrix4.skewX(_x),
                  child: new Transform(
                    transform: new Matrix4.rotationZ(_z),
                    child: new Padding(
                      padding: new EdgeInsets.all(10.0),
                      child: new Text('Hello World'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
