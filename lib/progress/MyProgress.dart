import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProgress extends StatefulWidget
{
  @override
  _MyProgressState createState() => _MyProgressState();
}

class _MyProgressState extends State<MyProgress>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("progress"),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              // 模糊进度条(会执行一个动画)
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
//进度条显示50%
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Column(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: // 模糊进度条(会执行一个旋转动画)
                    CircularProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),
                  ),
                ],
              ),


              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Center(
                child:
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                  child:
                  CircularProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    value: .5,
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.symmetric(vertical: 10)),

            ],
          ),
        ),
      ),
    );
  }
}