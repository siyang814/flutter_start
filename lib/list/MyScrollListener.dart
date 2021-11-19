import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/util/Common.dart';

class MyScrollListener extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _MyScrollListenerState();
  }
}

class _MyScrollListenerState extends State<MyScrollListener>
{
  @override
  Widget build(BuildContext context) {
    return Common.getScaffold(context, "scrollListener", _getInfo());
  }

  Widget _getInfo ()
  {
    return Scrollbar(child: NotificationListener<ScrollNotification>(child: child));
  }

}