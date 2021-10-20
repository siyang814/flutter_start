
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/User.dart';

class MyJson extends StatefulWidget
{
  @override
  _MyJsonState createState() => _MyJsonState();
}

class _MyJsonState extends State<MyJson>
{
  var _strJson = "_str2Json";
  var _jsonStr = "_json2Str";
  User? _user = null;
  _str2Json ()
  {
    String jsonStr='{"nickname": "coderTao","age": 20,"courses": ["政治", "高数", "英语"],"register_date": "2018-2-22","computer": {"brand": "MackBook","price": 9999}}';
    _user = User.fromJson(json.decode(jsonStr));
    _strJson = json.encode(_user);
    setState(() {
    });
  }

  _json2Str ()
  {
    String jsonStr='{"nickname": "coderTao","age": 20,"courses": ["政治", "高数", "英语"],"register_date": "2018-2-22","computer": {"brand": "MackBook","price": 9999}}';
    _user = User.fromJson(json.decode(jsonStr));
    _jsonStr = json.encode(_user);
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
              child: Text("_Str2Json ${_strJson}"),
            ),
            ElevatedButton(onPressed: _str2Json, child: Text("按我 _str2Json")),

            Padding(
              padding: EdgeInsets.all(20),
              child: Text("_json2Str is $_jsonStr"),
            ),
            ElevatedButton(onPressed: _json2Str, child: Text("按我 _json2Str")),

          ],
        ),
      ),
    );
  }
}