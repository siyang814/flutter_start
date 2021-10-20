
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'User.dart';

class MyJson extends StatefulWidget
{
  @override
  _MyJsonState createState() => _MyJsonState();
}

class _MyJsonState extends State<MyJson>
{
  var _str = "_json2Str";
  User _user = User("no name", "no email");
  _str2Json ()
  {
    String jsonStr='{"name": "John Smith","email": "john@example.com"}';
    _user = User.fromJson(json.decode(jsonStr));
    setState(() {
    });
  }

  _json2Str ()
  {
    _user = User("jsonName", "jsonEmail");
    _str = json.encode(_user.toJson());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json"),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("_Str2Json user.name is ${_user.name}; user.email is ${_user.email}"),
            ),
            ElevatedButton(onPressed: _str2Json, child: Text("按我 _str2Json")),

            Padding(
              padding: EdgeInsets.all(20),
              child: Text("_json2Str is $_str"),
            ),
            ElevatedButton(onPressed: _json2Str, child: Text("按我 _json2Str")),

          ],
        ),
      ),
    );
  }
}