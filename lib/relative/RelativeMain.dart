import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/relative/MyAlign.dart';
import 'package:my_start/relative/MyFlexLayout.dart';
import 'package:my_start/relative/MyStack.dart';
import 'package:my_start/relative/MyWrap.dart';
import 'package:my_start/util/Common.dart';

class RelativeMain extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Relative Scroll"),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              ElevatedButton(onPressed: () => Common.pushCupertino(context, MyAlign()), child: Text("Align")),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () => Common.pushCupertino(context, MyFlexLayout()), child: Text("FlexLayout")),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () => Common.pushCupertino(context, MyWrap()), child: Text("Wrap")),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () => Common.pushCupertino(context, MyStack()), child: Text("Stack")),
            ],
          ),
        ),
      ),
    );
  }
}