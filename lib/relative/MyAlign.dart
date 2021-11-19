import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_start/util/Common.dart';

class MyAlign extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text("Align"),
        leading: BackButton(
          onPressed: () => Common.popToPage(context),
        ),
      ),
      body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      reverse: true,
      child: Center(
        child: Column(
          children: [
            LimitedBox(
              maxHeight: 20,
              child: Container(
                child: Text("Alignment.topRight", style: TextStyle(backgroundColor: Colors.blue),),
              ),
            ),
            Container(
              color: Colors.blue[50],
              height: 120,
              width: 120,
              child: Align(
                alignment: Alignment.topRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            LimitedBox(
              maxHeight: 10,
              child: Container(
                color: Colors.black,
              ),
            ),
            Text("Alignment(1.5, -1.0)", style: TextStyle(backgroundColor: Colors.blue)),
            Container(
              color: Colors.blue[50],
              child: Align(
                widthFactor: 2,
                heightFactor: 2,
                alignment: Alignment(1.5, -1.0),
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            Text("FractionalOffset(0.5, 0.8)", style: TextStyle(backgroundColor: Colors.blue)),
            Container(
              color: Colors.blue[50],
              child: Align(
                widthFactor: 2,
                heightFactor: 2,
                alignment: FractionalOffset(0.5, 0.8),
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
    return scaffold;
  }
}