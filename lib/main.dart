import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class AnimatedLogo extends AnimatedWidget{

  static final _opacityTween = new Tween<double>(begin: 0.0,end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0,end: 300.0);
  static final _rotateTween = new Tween<double>(begin: 0.0,end: 12.0);
  AnimatedLogo({Key key, Animation<double> animation}): super(key: key,listenable: animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animation = listenable;

    return new Center(
      child: new Transform.rotate(
        angle: _rotateTween.evaluate(animation),
        child: new Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: new Container(
            margin: new EdgeInsets.symmetric(vertical: 10.0),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: new FlutterLogo(),
          )
        )
      ),
    );

  }

}

class _State extends State<MyApp> with TickerProviderStateMixin{
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 2000),vsync: this);
    animation = new CurvedAnimation(parent: controller,curve: Curves.easeIn);
    animation.addStatusListener(listener);
    controller.forward();
  }

  void listener(AnimationStatus status){
    if(status == AnimationStatus.completed){
      controller.reverse();
    }else if(status == AnimationStatus.dismissed){
      controller.forward();
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
        child: new AnimatedLogo(animation: animation,),
      ),
    );
  }
}
