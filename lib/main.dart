import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:simple_permissions/simple_permissions.dart';

List<CameraDescription> cameras;

Permission permissionFromString(String value) {
  Permission permission;
  for (Permission item in Permission.values) {
    if (item.toString() == value) {
      permission = item;
      break;
    }
  }
  return permission;
}

void main() async {
  cameras = await availableCameras();

  await SimplePermissions.requestPermission(
      permissionFromString('Permission.WriteExternalStorage'));
  await SimplePermissions.requestPermission(
      permissionFromString('Permission.WriteInternalStorage'));

  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  CameraController controller;
  final GlobalKey<ScaffoldState> key = new GlobalKey();
  Permission _permissionCamera;
  Permission _permissionStorage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = new CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  Future<String> saveImage() async {
    String timeStamp = new DateTime.now().millisecondsSinceEpoch.toString();
    String filePath = '/sdcard/Pictures/${timeStamp}.jpg';

    if (controller.value.isTakingPicture) return null;
    try {
      await controller.takePicture();
    } on CameraException catch (e) {
      showInSnckBar(e.toString());
    }
    return filePath;
  }

  void takePicture() async {
    bool hasCamera = await SimplePermissions.checkPermission(_permissionCamera);
    bool hasStorage =
        await SimplePermissions.checkPermission(_permissionStorage);
    if (!hasStorage || !hasCamera) {
      showInSnckBar('Lacking permissio to take a pictue');
      return;
    }
    saveImage().then((String filePath) {
      if (mounted && filePath!=null) showInSnckBar('picture Saved to ${filePath}');
    });
  }

  void showInSnckBar(String message) {
    key.currentState.showSnackBar(new SnackBar(content: new Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
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
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new RaisedButton(
                      onPressed: takePicture, child: new Text('Take Picture')),
                  new RaisedButton(
                      onPressed: SimplePermissions.openSettings,
                      child: new Text('Setting'))
                ],
              ),
              new AspectRatio(
                  aspectRatio: 1.0, child: new CameraPreview(controller)),
              new Text('Hello World')
            ],
          ),
        ),
      ),
    );
  }
}
