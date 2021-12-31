import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/util/Common.dart';
import 'package:english_words/english_words.dart';

class MyInfinityList extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _MyInfinityListState();
  }
}

class _MyInfinityListState extends State<MyInfinityList>
{
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];
  @override
  Widget build(BuildContext context) {
    return Common.getScaffold(context, "infinityList", _getList());
  }

  Widget _getList ()
  {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        if ( _words[index] == loadingTag )
          {
            if ( _words.length -1 < 100 )
              {
                _retrieveData();
                return Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 5,),
                  ),
                );
              }
            else
              {
                return Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }
          }
        return ListTile(title: Text(_words[index]),);
      },
      separatorBuilder: (context, index) {
        return Divider(height: 0,);
      },
    );

  }

  _retrieveData ()
  {
    Future.delayed(Duration(seconds: 1)).then((value){
      setState(() {
        _words.insertAll(_words.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }
}