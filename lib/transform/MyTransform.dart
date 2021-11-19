
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/util/Common.dart';
import 'dart:math' as math;

class MyTransform extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var widget = SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      reverse: true,
      child: Center(
        child: Column(
          children: [
            Container(
              child: Text("角度", style: TextStyle(backgroundColor: Colors.green),),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 40,
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text("平移"),
            ),

            DecoratedBox(
              decoration:BoxDecoration(color: Colors.red),
              //默认原点为左上角，左移20像素，向上平移5像素
              child: Transform.translate(
                offset: Offset(-20.0, -5.0),
                child: Text("Hello world"),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text("平移"),
            ),
            DecoratedBox(
              decoration:BoxDecoration(color: Colors.red),
              //默认原点为左上角，左移20像素，向上平移5像素
              child: Transform.translate(
                offset: Offset(-20.0, 0.0),
                child: Text("Hello world"),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text("旋转"),
            ),
            DecoratedBox(
              decoration:BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                //旋转90度 /2, 180 /1
                angle:math.pi/2 ,
                child: Text("Hello world"),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text("缩放"),
            ),

        DecoratedBox(
            decoration:BoxDecoration(color: Colors.red),
            child: Transform.scale(
                scale: 1.5, //放大到1.5倍
                child: Text("Hello world")
            )
        ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Center(
                child: Text("transform只控制绘制，实际控件不变,RotatedBox会改变控件",style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
              )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  //将Transform.rotate换成RotatedBox
                  child: RotatedBox(
                    quarterTurns: 1, //旋转90度(1/4圈)
                    child: Text("Hello world"),
                  ),
                ),
                Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
              ],
            ),

          ],

        ),
      ),
    );
    return Common.getScaffold(context, "transform", widget);
  }
}