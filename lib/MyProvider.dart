
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MyProvider extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return MyProviderState();
  }
}

class MyProviderState extends State<MyProvider>
{
  var _count = -1;
  var _filePath = "unfind path";

  @override
  void initState() {
    super.initState();
    _readCount().then((value) {
      setState(() {
        _count = value;
      });
    });
  }

  Future<File> _getLocalFile () async
  {
    String dir = (await getApplicationDocumentsDirectory()).path;
    setState(() {
      _filePath = dir;
    });
    return File('$dir/count.txt');
  }

  Future<int> _readCount () async {
    try{
      File file = await _getLocalFile();
      String count = await file.readAsString();
      return int.parse(count);
    } on Exception{
      return 0;
    }
  }

  Future<Null> _incrementCount () async
  {
    setState(() {
      _count++;
    });
    await (await _getLocalFile()).writeAsString('$_count');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('本地存储Provider'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text("Button tapped $_count time${_count <= 1 ? '' : 's'}"),
          ),
          Text("file path is$_filePath"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCount(),
        tooltip: 'click',
        child: Icon(Icons.add),
      ),
    );
  }
}