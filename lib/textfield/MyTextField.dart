import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField>
{
  var _name = "";
  var _pass = "";

  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      _name = _nameController.text;
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Text("name is $_name; pass is $_pass"),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或者邮箱",
                prefixIcon: Icon(Icons.person),
              ),
              controller: _nameController,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock),
              ),
              onChanged: (value) {
                setState(() {
                  _pass = value;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}