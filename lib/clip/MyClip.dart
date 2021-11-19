import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/util/Common.dart';

class MyClip extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var widgetImg = Image.asset("images/img1.jpeg");
    var column = Center(
      child: Column(
        children: [
          widgetImg,
          ClipOval(child: widgetImg,),  //圆
          ClipRRect(child: widgetImg,borderRadius: BorderRadius.circular(10),),  //圆角

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5,//宽度设为原来宽度一半，另一半会溢出
                child: widgetImg,
              ),
              Text("你好世界", style: TextStyle(color: Colors.green),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(//将溢出部分剪裁
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,//宽度设为原来宽度一半
                  child: widgetImg,
                ),
              ),
              Text("你好世界",style: TextStyle(color: Colors.green))
            ],
          ),

        ],
      ),
    );
    return Common.getScaffold(context, "clip", column);
  }
}