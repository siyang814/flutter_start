import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/util/Common.dart';

class MyStack extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var con = ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: Text("Hello world",style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Positioned(
              top: 18.0,
              child: Text("Your friend"),
            ),
            Positioned(
              right: 18.0,
                child: Text("My Friends")
            ),
            Positioned(
                bottom: 30,
                child: Text("My Bottom")
            ),
          ],
        ),
    );

    return Common.getScaffold(context, "Stack", con);
  }
}