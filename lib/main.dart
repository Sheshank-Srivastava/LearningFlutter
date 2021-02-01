import 'package:flutter/material.dart';
import 'dart:async';
import 'package:permission/permission.dart';

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
  String status;
  Permission permission;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    status = 'Select an Item';
    print('$status ${Permission.channel}');
  }

  requestPermission() async{
    bool res = await SimplePermission.requestPermission(permission);
    print('Permission Results is ${res.toString()}');
    setState((){
      status = '${permission.toString()} = ${res.toString()}';
    });
  }
  checkPermission() async{
    bool res = await SimplePermission.checkPermission(permission);
    print('Permission Results is ${res.toString()}');
    setState((){
      status = '${permission.toString()} = ${res.toString()}';
    });
  }
  getPermissionStatus() async{
    final res = await SimplePermission.getPermissionStatus(permission);
    print('Permission Results is ${res.toString()}');
    setState((){
      status = '${permission.toString()} = ${res.toString()}';
    });
  }

  onDropDownChanged(Permission permission){
    setState((){
      this.permission = permission;
      status = 'Click a button below';
    });
    print(permission);

  }
  List<DropdownMenuItem<Permission>> _getDropDownItems(){
    List<DropdownMenuItem<Permission>> items = new List<DropdownMenuItem<Permission>>();
    Permission..forEach((permission){
      var item = new DropdownMenuItem(child:new Text(getPermissionString(permission)),value:permission,);
      items.add(item);
    });
    return items;
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
              new Text(status),null
              new DropdownButton(items:_getDropDownItems(),value: ,),
              new RaisedButton(
                onPressed: null,
                child: new Text('Check Permission'),
              ),new RaisedButton(
                onPressed: null,
                child: new Text('Request Permission'),
              ),new RaisedButton(
                onPressed: null,
                child: new Text('Get Status'),
              ),new RaisedButton(
                onPressed: null,
                child: new Text('Open Setting'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
