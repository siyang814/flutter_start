import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyUrlLaucher extends StatefulWidget
{
  @override
  _MyUrlLaucherState createState()=> _MyUrlLaucherState();
}

class _MyUrlLaucherState extends State<MyUrlLaucher>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("urlLaucher"),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: RaisedButton(
        onPressed: () => _lauchUrl(),
        child: Text("打开百度"),
      ),
    );
  }

  _lauchUrl ()
  {
    launch("https://www.baidu.com");
  }
}