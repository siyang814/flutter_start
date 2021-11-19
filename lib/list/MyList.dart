import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/layoutbuilder/ResponsiveColumn.dart';
import 'package:my_start/util/Common.dart';

class MyList extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return Common.getScaffold(context, "list", _list(context));
  }

  Widget _list ( BuildContext context )
  {
    var divider1 = Divider(color: Colors.blue,);
    var divider2 = Divider(color: Colors.green,);
    var list = ListView.separated(
        itemBuilder: (context, index){
          return Container(
            height: 30,
            alignment: Alignment.center,
          child: LayoutLogPrint(
            tag: index,
            child: Text("index is $index"),
          ),
          );
        },
        separatorBuilder: (context, index) {
          return index % 2 == 0 ? divider1 : divider2;
        },
        itemCount: 100);
    return list;
  }
}