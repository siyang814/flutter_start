import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/http/MyDioInstance.dart';
import 'package:my_start/http/UserModel.dart';

class MyHttp extends StatefulWidget
{
  @override
  _MyHttpState createState()=> _MyHttpState();
}

class _MyHttpState extends State<MyHttp>
{
  var _ipAddress = "UnKnown";
  var _jsonName = "UnKnown";
  var _json2modelStr = "UnKnown";
  var _model2JsonStr = "UnKnown";

  Future _getIpAddress () async
  {
    var result = "";
    var url = 'https://httpbin.org/ip';
    //阻塞线程的调用
    // result = await MyDioInstance().get(url);
    MyDioInstance().get(url).then((value) {
      print(value);
      result = value;
      var j = json.decode(result);
      result += " - ${j["origin"]}";
      setState(() {
        _ipAddress = result;
      });
    });

  }

  _jsonTest ()
  {
    //一个JSON格式的用户列表字符串
    String jsonStr='[{"name":"Jack"},{"name":"Rose"}]';
    print(jsonStr);
//将JSON字符串转为Dart对象(此处是List)
    List items=json.decode(jsonStr);
//输出第一个用户的姓名
    print(items[0]["name"]);

    String jsonStr1='{"name":"Jack"}';
    _jsonName = json.decode(jsonStr1)["name"] + "-";
    setState(() {
      _jsonName += items[1]["name"];
    });
  }

  _json2Model ()
  {
    var js = '{"name":"Jack", "origin":"1086"}';
    Map<String, dynamic> sd = json.decode(js);
    print("sd is ${sd.toString()}");
    UserModel userModel = UserModel.fromJson(sd);
    setState(() {
      _json2modelStr = "name is ${userModel.name}; origin is ${userModel.origin}";
    });
  }

  _model2Json()
  {
    UserModel userModel = UserModel("name", "origin");
    // Map<String, dynamic> sd = userModel.toJson();
    String result = json.encode(userModel);
    setState(() {
      // _model2JsonStr = sd.toString();
      _model2JsonStr = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("http"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Text("ip address is $_ipAddress"),
          Text("data"),
          ElevatedButton(
              onPressed: () => _getIpAddress(),
              child: Text('按我get()')
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text("json is $_jsonName"),
          ),
          ElevatedButton(onPressed: _jsonTest, child: Text("按我json")),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text("json2Model is $_json2modelStr"),
          ),
          ElevatedButton(onPressed: _json2Model, child: Text("按我Json2Model")),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text("model2Json is $_model2JsonStr"),
          ),
          ElevatedButton(onPressed: _model2Json, child: Text("按我Model2Json")),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text("model2Json is $_model2JsonStr"),
          ),
          ElevatedButton(onPressed: _model2Json, child: Text("按我使用插件处理")),
        ],
      ),
    );
  }
}