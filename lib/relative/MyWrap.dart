import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/util/Common.dart';

class MyWrap extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap"),
        leading: BackButton(onPressed: () => Common.popToPage(context),),
      ),
      body: Wrap(
        spacing: 8.0,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: [
          Chip(label: Text("I Am A"), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("A"),),),
          Chip(label: Text("I Am B"), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("B"),),),
          Chip(label: Text("I Am C"), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("C"),),),
          Chip(label: Text("I Am D"), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("D"),),),
          Chip(label: Text("I Am E"), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("E"),),),
          Chip(label: Text("I Am F"), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("F"),),),
          Chip(label: Text("I Am G"), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("G"),),),
          Chip(label: Text("I Am H"), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("H"),),),
          Chip(label: Text("I Am I"), avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("I"),),),
        ],
      ),
    );
  }
}