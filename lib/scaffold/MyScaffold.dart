import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_start/util/Common.dart';

class MyScaffold extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return getScafflod(context);
  }

  Widget getScafflod (BuildContext context)
  {
    var scafflod = Scaffold(
      appBar: AppBar(
        title: Text("scafflod"),
        //自定义菜单icon， 不设置会有一个默认的
        leading: Builder(builder: (context) => IconButton(onPressed: () => _sliderShow(context),icon: Icon(Icons.align_horizontal_left_outlined),),),

      ),
      drawer: MyDrawer(),
      bottomNavigationBar: _bottomBar(),
      floatingActionButton: _floatingActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: GestureDetector(
          child: Text("click to finish", style: TextStyle(fontSize: 30, backgroundColor: Colors.orange,),),
          onTap: () => Common.popToPage(context),
        ),
      ),
    );
    return scafflod;
  }

  Widget _floatingActionBtn ()
  {
    var floatingActionButton = FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
    },
    );
    return floatingActionButton;
  }

  _sliderShow (BuildContext context )
  {
    Scaffold.of(context).openDrawer();
  }

  Widget _bottomBar ()
  {
    var bottomBar = BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home), onPressed: () {  },
          ),
          SizedBox(),
          IconButton(onPressed: (){} , icon: Icon(Icons.business)),
        ],
      ),
    );
    return bottomBar;
  }

}

class MyDrawer extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 38),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: ClipOval(
                        child: Image.asset("images/img1.jpeg", height: 60, width: 60,),
                      ),
                    ),
                    Text("昵称")
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.add),
                      title: Text("添加账号"),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("设置"),
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}