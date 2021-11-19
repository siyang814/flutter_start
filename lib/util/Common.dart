import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Common
{
  static pushToPage (BuildContext context, Widget widget) => Navigator.push(context, MaterialPageRoute(builder: (context) => widget,));
  static popToPage (BuildContext context) => Navigator.pop(context);

  static pushCupertino ( BuildContext context, Widget widget) => Navigator.push(context, CupertinoPageRoute(builder: (context) => _pageContainer(widget),));
  static Widget _pageContainer (Widget widget) => MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance!.window).copyWith(textScaleFactor: 1),
      child: widget);

  static Widget getScaffold (BuildContext context, String title, Widget widget) => Scaffold(
    appBar: AppBar(
      title: Text(title),
      leading: BackButton(
        onPressed: () => popToPage(context),
      ),
    ),
    body: widget,
  );

  static taost (BuildContext context, String str)
  {
    Scaffold.of(context).showBottomSheet((context) => Text(str));
  }

  static log ( String str)
  {
    print("==========>");
    print(str);
  }

}