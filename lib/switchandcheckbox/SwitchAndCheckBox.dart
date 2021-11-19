

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchAndCheckBox extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() =>_SwitchAndCheckBoxState();
}

class _SwitchAndCheckBoxState extends State<SwitchAndCheckBox>
{
  bool? _isChecked = true;
  var _isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SwitchAndCheckBox"),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Switch(value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                });
              },),
          Checkbox(value: _isChecked,
              activeColor: Colors.amber,
              onChanged: (value) {
                setState(() {
                  _isChecked = value;
                });
              },),
        ],
      ),
    );
  }
}