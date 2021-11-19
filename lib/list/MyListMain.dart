import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/list/MyExpandedList.dart';
import 'package:my_start/list/MyInfinityList.dart';
import 'package:my_start/list/MyList.dart';
import 'package:my_start/list/MyScrollController.dart';
import 'package:my_start/list/MySpecificHeightList.dart';
import 'package:my_start/util/Common.dart';

class MyListMain extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Common.getScaffold(
      context,
      "list",
      ListView(
        children: [
          ListTile(
            title: Text("分割线"),
            onTap: () => Common.pushCupertino(context, MyList()),
          ),
          ListTile(
            title: Text("SpecificHeight"),
            onTap: () => Common.pushCupertino(context, MySpecificHeightList()),
          ),
          ListTile(
            title: Text("无限加载"),
            onTap: () => Common.pushCupertino(context, MyInfinityList()),
          ),
          ListTile(
            title: Text("expanded"),
            onTap: () => Common.pushCupertino(context, MyExpandedList()),
          ),
          ListTile(
            title: Text("ScrollController"),
            onTap: () => Common.pushCupertino(context, MyScrollController()),
          ),
        ],
      ),
    );
  }
}