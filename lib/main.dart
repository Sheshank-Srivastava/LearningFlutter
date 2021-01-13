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

class _State extends State<MyApp> {
  // String _value = 'Hello World';
  // int _int = 0;
  // String _newValue = '';

  // bool _value1 = false;
  // bool _value2 = false;
  //
  // void _value1Chnaged(bool value) => setState(() => _value1 = value);
  //
  // void _value2Chnaged(bool value) => setState(() => _value2 = value);
  // int _value1 = 0;
  // int _value2 = 0;
  //
  // void _setValue1(int value) {
  //   setState(() {
  //     _value1 = value;
  //   });
  // }
  //
  // void _setValue2(int value) => setState(() => _value2 = value);
  //
  // Widget makeRadios() {
  //   List<Widget> list = new List();
  //   for (var i = 0; i < 3; i++) {
  //     list.add(new Radio(
  //       value: i,
  //       groupValue: _value1,
  //       onChanged: _setValue1,
  //     ));
  //   }
  //   Column column = new Column(
  //     children: list,
  //   );
  //   return column;
  // }
  //
  // Widget makeRadiosTiles() {
  //   List<Widget> list = new List();
  //   for (var i = 0; i < 3; i++) {
  //     list.add(new RadioListTile(
  //       value: i,
  //       groupValue: _value2,
  //       onChanged: _setValue2,
  //       activeColor: Colors.green,
  //       controlAffinity: ListTileControlAffinity.trailing,
  //       title: new Text('Item ${i}'),
  //       subtitle: new Text('Subtitle ${i}'),
  //     ));
  //   }
  //   Column column = new Column(
  //     children: list,
  //   );
  //   return column;
  // }

  // bool _value1 = false;
  // bool _value2 = false;
  //
  // void _onChanged1(bool value) => setState(() => _value1 = value);
  //
  // void _onChanged2(bool value) => setState(() => _value2 = value);

  // void _onChange(String value) {
  //   setState(() => _value = 'Change: ${value}');
  // }
  //
  // void _onSubmit(String value) {
  //   setState(() => _value = 'Submit: ${value}');
  // }
  //
  // void _onPressed(String value) {
  //   setState(() {
  //     _value = value;
  //     _value = new DateTime.now().toString();
  //   });
  // }
  //
  // void _add() {
  //   setState(() {
  //     _int++;
  //     _value = _int.toString();
  //   });
  // }
  //
  // void _subtract() {
  //   setState(() {
  //     _int--;
  //     _value = _int.toString();
  //   });
  // }

  // double _value = 0.0;
  //
  // void _setValue(double value) => setState(() => _value = value);

  // String _value='';
  // Future _selectDate() async{
  //   DateTime picked = await showDatePicker(
  //     context: context,
  //     initialDate:new DateTime.now(),
  //     firstDate: new DateTime(2016),
  //     lastDate: new Dat eTime.now(),
  //   );
  //   if  (picked!=null) setState(() {
  //     _value = picked.toString();
  //   });
  // }

  int _value = 0;
  String _floatValue = '';
void  _onFloatClicked()=>setState(()=> _floatValue=new DateTime.now().toString());
  void _add() => setState(() => _value++);

  void _remove() => setState(() => _value--);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name Here'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: _add),
          new IconButton(icon: new Icon(Icons.remove), onPressed: _remove)
        ],
      ),
      drawer: new Drawer(
        child: new Container(
          padding :new EdgeInsets.all(32.0),
          child:new Column(
            children: <Widget>[
              new Text('Hello Drawer'),
              new RaisedButton(onPressed: ()=>Navigator.pop(context),child:new Text('close'))
            ],
          )
        ),
      ),
      floatingActionButton: new FloatingActionButton(onPressed: _onFloatClicked,
      backgroundColor: Colors.green,
      mini: false,
      child:new Icon(Icons.timer )),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(
                _floatValue,
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 37.0),
              )
              // new Text(_value),
              // new RaisedButton(
              //   onPressed: _selectDate,
              //   child: new Text('Click me'),
              // )
              //  new Text('value ${(_value *100).round()}'),
              // new Slider(value: _value,
              //   onChanged: _setValue,
              //   activeColor: Colors.red,
              //   inactiveColor: Colors.black,
              // max: 0.5,
              // min: 0.1,)
              // new Checkbox(
              //   value: _value1,
              //   onChanged: _value1Chnaged,
              // ),
              // makeRadios(),
              // makeRadiosTiles(),
              // new Switch(value: _value1, onChanged: _onChanged1,activeColor: Colors.green,),
              // new SwitchListTile(
              //   value: _value2,
              //   onChanged: _onChanged2,
              //   title: new Text(
              //     'Hello World',
              //     style: new TextStyle(
              //         fontWeight: FontWeight.bold,
              //         color: Colors.red
              //     ),
              //   ),
              // )
              // new CheckboxListTile(
              //   value: _value2,
              //   onChanged: _value2Chnaged,
              //   title: new Text('Hello World'),
              //   controlAffinity: ListTileControlAffinity.leading,
              //   subtitle: new Text('Subtitle'),
              //   secondary: new Icon(Icons.archive),
              //   activeColor: Colors.red,
              // ),

              // new RaisedButton(
              //   onPressed: () => _onPressed('Hello Tanya'),
              //   child: new Text('Click me Raised'),
              //   color: Colors.pink,
              //   textColor: Colors.green ,
              // ),
              // new FlatButton(
              //   onPressed: () => _onPressed('Hello Seema'),
              //   child: new Text('Click me Flat'),
              // ),
              // new IconButton(icon: new Icon(Icons.add),
              //     onPressed: _add),
              // new IconButton(
              //     icon: new Icon(Icons.remove),
              //     onPressed: _subtract,
              //     color: Colors.pink),
              // new TextField(
              //   decoration: new InputDecoration(
              //       labelText: 'name',
              //       hintText: 'Puneet',
              //       icon: new Icon(Icons.people)
              //   ),
              //   autocorrect: true,
              //   autofocus: true,
              //   keyboardType: TextInputType.text,
              //   onChanged: _onChange,
              //   onSubmitted: _onSubmit,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
