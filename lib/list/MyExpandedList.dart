import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/util/Common.dart';

class MyExpandedList extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _MyExpandedListState();
  }
}

class _MyExpandedListState extends State<MyExpandedList>
{
  @override
  Widget build(BuildContext context) {
    return Common.getScaffold(context, "expandedList", _getList());
  }
  Widget _getList ()
  {
    return Column(
      children: [
        ListTile(title: Text("我是标题"),),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(title: Text("index is ${index + 1}"),),
                separatorBuilder: (context, index) => Divider(height: 0.0, color: Colors.transparent,),
                itemCount: 40)),
      ],
    );
  }
}