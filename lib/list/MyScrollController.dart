import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/util/Common.dart';

class MyScrollController extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _MyScrollControllerState();
  }
}

class _MyScrollControllerState extends State<MyScrollController>
{
  ScrollController _scrollController = ScrollController();
  bool showTopBtn = false;
  var limit = 1000;


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      Common.log("$_scrollController.offset");
      if ( _scrollController.offset < 1000 && showTopBtn )
        {
          setState(() {
            showTopBtn = false;
          });
        }
      else if ( _scrollController.offset > 1000 && !showTopBtn )
        {
          setState(() {
            showTopBtn = true;
          });
        }
    });
  }
  
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollController"),
        leading: BackButton(onPressed: () => Common.popToPage(context),),
      ),
      floatingActionButton: !showTopBtn ? null : Container(
        width: 112,
        child: Row(
          children: [
            FloatingActionButton(onPressed: () => _goTop(),child: Icon(Icons.arrow_upward)),
            FloatingActionButton(onPressed: () => _moveTop(),child: Icon(Icons.arrow_circle_up)),
          ],
        ),
      ),
      body: ListView.builder(
        itemExtent: 50,
        itemCount: 100,
        controller: _scrollController,
        itemBuilder: (context, index) {
        return ListTile(title: Text("index is ${index + 1}"),);
      },),
    );
  }
  
  _goTop ()
  {
    _scrollController.animateTo(0, duration: Duration(seconds: 2), curve: Curves.ease);
  }
  _moveTop ()
  {
    _scrollController.jumpTo(0);
  }
}