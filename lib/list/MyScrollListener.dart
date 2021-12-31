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
  String _progress = "0%";
  int _max = 0;
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Common.getScaffold(context, "scrollListener", _getInfo());
  }

  Widget _getInfo ()
  {
    return Scrollbar(
        child: NotificationListener<ScrollNotification>(
            child:Stack(
              alignment: Alignment.center,
              children: [
                ListView.builder(
                  itemCount: 100,
                    itemExtent: 50,
                    itemBuilder: (context, index) => ListTile(title: Text("index is $index"),),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Text(_progress),
                      backgroundColor: Colors.black54,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "max=${_max};current=${_current}",
                      ),
                    ),

                  ],
                ),

              ],
            ),
          onNotification: (notification) {
              double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
              setState(() {
                _max = notification.metrics.maxScrollExtent.toInt();
                _current = notification.metrics.pixels.toInt();
                _progress = "${(progress * 100).toInt()}%";
              });
              print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            return false;
          },
        ),
    );
  }

}