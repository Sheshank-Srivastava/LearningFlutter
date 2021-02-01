import 'package:flutter/material.dart';
import 'dart:async';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:contacts_service/contacts_service.dart';

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
  await SimplePermissions.requestPermission(
      permissionFromString('Permission.ReadContacts'));
  await SimplePermissions.requestPermission(
      permissionFromString('Permission.WriteContacts'));

  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  void _create() async {
    Contact contact = new Contact(
        familyName: 'Srivastava',
        givenName: 'Sheshank',
        emails: [new Item(label: 'work', value: 'abc@gmail.com')]);
    await ContactsService.addContact(contact);
    showInSnackBar('Created contact');
  }

  void _find() async {
    Iterable<Contact> people =
        await ContactsService.getContacts(query: 'Sheshank');
    showInSnackBar('There are ${people.length} people named Sheshank');
  }

  void _read() async {
    Iterable<Contact> people =
        await ContactsService.getContacts(query: 'Sheshank');
    Contact contact = people.first;
    showInSnackBar('Sheshank email is ${contact.emails.first.value}');
  }

  void _delete() async {
    Iterable<Contact> people =
    await ContactsService.getContacts(query: 'Sheshank');
    Contact contact = people.first;
    await ContactsService.deleteContact(contact);
    showInSnackBar('Sheshank Deleted');
  }

  void showInSnackBar(String message) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
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
              new Text('Contacts'),
              new RaisedButton(
                onPressed: _create,
                child: new Text('Create'),
              ),
              new RaisedButton(
                onPressed: _find,
                child: new Text('Find'),
              ),
              new RaisedButton(
                onPressed: _read,
                child: new Text('Read'),
              ),
              new RaisedButton(
                onPressed: _delete,
                child: new Text('Delete'),
              ),
              new RaisedButton(
                onPressed: SimplePermissions.openSettings,
                child: new Text('Delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
