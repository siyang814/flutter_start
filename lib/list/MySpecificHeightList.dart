import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/layoutbuilder/ResponsiveColumn.dart';
import 'package:my_start/util/Common.dart';

class MySpecificHeightList extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Common.getScaffold(
      context,
      "SpecificHeight",
      ListView.builder(
        itemCount: 100,
        //设置固定高度 参考view
        prototypeItem: ListTile(title: Text(""),),
        //固定高度 数值
        // itemExtent: 48,

        itemBuilder: (context, index) {
          return LayoutLogPrint(
              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: ListTile(
                  title: Text("index is $index", style: TextStyle(backgroundColor: Colors.red),),
                ),
              )
          );
      },
      )
    );
  }
}