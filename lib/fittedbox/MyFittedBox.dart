import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/fittedbox/SingleLineFittedBox.dart';
import 'package:my_start/util/Common.dart';

class MyFittedBox extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var center = Center(
      child: Column(
        children: [
          Text("长度超长"),
          Row(children: [Text('xx'*60)]), //文本长度超出 Row 的最大宽度会溢出
          wContainer(BoxFit.none),
          Text('绘制超出'),
          ClipRect(child: wContainer(BoxFit.none),),
          Text('绘制超出部分被裁切'),
          wContainer(BoxFit.contain),
          Text('按比例填充'),

          SingleLineFittedBox(child: Row(children: [Text('xx'*60)]),),
          Text("改变字体大小自适应一行"),

        ],
      ),
    );
    return Common.getScaffold(context, "fittedBox", center);
  }

  Widget wContainer(BoxFit boxFit) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        // 子容器超过父容器大小
        child: Container(width: 60, height: 70, color: Colors.blue),
      ),
    );
  }
}