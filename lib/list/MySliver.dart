import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySliver extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          // AppBar，包含一个导航栏.
          SliverAppBar(
            pinned: true, // 滑动到顶端时会固定住
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('MySliver'),
              background: Image.asset(
                "images/img1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: PageView(
                children: [
                  Center(
                    child: Image.asset(
                      "images/img1.jpeg",
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Center(
                    child: Text("2"),
                  ),
                  Center(
                    child: Text("3"),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              //Grid
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                //创建列表项
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}