import 'package:flutter/material.dart';
import 'package:my_start/AnimatedListSample.dart';
import 'package:my_start/AppBarBottomSample.dart';
import 'package:my_start/BasicAppBarSample.dart';
import 'package:my_start/ExpansionTileSample.dart';
import 'package:my_start/Global.dart';
import 'package:my_start/MyImage.dart';
import 'package:my_start/MyFirstApp.dart';
import 'package:my_start/TabbedAppBarSample.dart';


// void main() {
//   runApp( MyApp());
// }

void main()=>MyGlobal.init().then((value) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: MyGridView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyGridView extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    final GridView gridView;
    gridView = GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 5/1,
      ),
      itemCount: MyGlobal.mainStr.length,
      shrinkWrap: true, //父亲自适应高度
      scrollDirection: Axis.vertical,   //滚动方向

      itemBuilder: (context, index) {
        var item = ElevatedButton(
          child: Text(MyGlobal.mainStr[index], style: TextStyle(fontSize: 18),),
          onPressed: (){
            switch(index)
            {
              case 0:
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyFirstApp()));
                break;
              case 1:
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyImage()));
                break;
              case 2:
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AnimatedListSample()));
                break;
              case 3:
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppBarBottomSample(),));
                break;
              case 4:
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => BasicAppBarSample(),));
                break;
              case 5:
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpansionTileSample(),));
                break;
              case 6:
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TabbedAppBarSample(),));
                break;
            }
          },
        );
        return item;
    },);
    return gridView;
  }
}

