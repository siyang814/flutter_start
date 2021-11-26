import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/util/Common.dart';

class MyAnimatedList extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAnimatedListState();
  }
}

class MyAnimatedListState extends State<MyAnimatedList>
{

  var data = <String>[];
  int counter = 5;

  final globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    for ( int i = 0; i < counter; i++)
      {
        data.add("${i + 1}");
      }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Common.getScaffold(context, "MyAnimatedList", _getInfo(context) );
  }

  Widget _getInfo (BuildContext context)
  {
    var stack = Stack(
        children: [
          AnimatedList(
            key: globalKey,
              initialItemCount: data.length,

              itemBuilder: (context, index, animation) {
                return FadeTransition(
                    opacity: animation,
                  child: _bulidItem(context, index),
                );
              },
          ),
          _buildAddBtn(),
        ],
    );
    return stack;
  }

  Widget _bulidItem (BuildContext context, int index)
  {
    var str = data[index];
    return ListTile(
      key: ValueKey(str),
      title: Text(
        str
      ),
      trailing: IconButton(
          onPressed: () => _delete(context, index),
          icon: Icon(Icons.delete)
      ),
    );
  }

  // 创建一个 “+” 按钮，点击后会向列表中插入一项
  Widget _buildAddBtn() {
    return Positioned(
      child: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // 添加一个列表项
          data.add('${++counter}');
          // 告诉列表项有新添加的列表项
          globalKey.currentState!.insertItem(data.length - 1);
          print('添加 $counter');
        },
      ),
      bottom: 30,
      left: 0,
      right: 0,
    );
  }


  _delete (BuildContext context, int index )
  {
    setState(() {
      globalKey.currentState!.removeItem(
        index,
            (context, animation) {
          // 删除过程执行的是反向动画，animation.value 会从1变为0
          var item = _bulidItem(context, index);
          print('删除 ${data[index]}');
          data.removeAt(index);
          // 删除动画是一个合成动画：渐隐 + 缩小列表项告诉
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              //让透明度变化的更快一些
              curve: const Interval(0.5, 1.0),
            ),
            // 不断缩小列表项的高度
            child: SizeTransition(
              sizeFactor: animation,
              axisAlignment: 0.0,
              child: item,
            ),
          );
        },
        duration: Duration(milliseconds: 200), // 动画时间为 200 ms
      );
    });
  }
  
}