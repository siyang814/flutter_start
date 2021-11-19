
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/util/Common.dart';

class MyDecorateBox extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var decorateBox = DecoratedBox(
    decoration: BoxDecoration(
    gradient: LinearGradient(colors:[Colors.red,Colors.orange.shade700]), //背景渐变
    borderRadius: BorderRadius.circular(3.0), //3像素圆角
    boxShadow: [ //阴影
    BoxShadow(
    color:Colors.black54,
    offset: Offset(2.0,2.0),
    blurRadius: 4.0
    )
    ]
    ),
    child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
    child: Text("Login", style: TextStyle(color: Colors.white),),
    )
    );
    return Common.getScaffold(context, "DecorateBox", decorateBox);
  }
}