import 'package:flutter/material.dart';

class MyImage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Image View"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyImage()));
          }, icon: Icon(Icons.person))
        ],
      ),
      body:CustomScrollView(
        physics: BouncingScrollPhysics(), //ios风格的上拉出来空白
        reverse: false,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(
                    child: Column(
                      children: [
                        Text('contain'),
                        Container(
                          color: Colors.orange,
                          child: Image(width: 200, height: 100, image: AssetImage('images/img1.jpeg'),fit: BoxFit.contain,),
                        ),
                        Text('cover'),
                        Container(
                          color: Colors.orange,
                          child: Image(width: 200, height: 100, image: AssetImage('images/img1.jpeg'),fit: BoxFit.cover,),
                        ),
                        Text('fill'),
                        Container(
                          color: Colors.orange,
                          child: Image(width: 200, height: 100, image: AssetImage('images/img1.jpeg'),fit: BoxFit.fill,),
                        ),
                        Text('fitHeight'),
                        Container(
                          color: Colors.orange,
                          child: Image(width: 200, height: 100, image: AssetImage('images/img1.jpeg'),fit: BoxFit.fitHeight,),
                        ),
                        Text('fitWidth'),
                        Container(
                          color: Colors.orange,
                          child: Image(width: 200, height: 100, image: AssetImage('images/img1.jpeg'),fit: BoxFit.fitWidth,),
                        ),
                        Text('scaleDown'),
                        Container(
                          color: Colors.orange,
                          child: Image(width: 200, height: 100, image: AssetImage('images/img1.jpeg'),fit: BoxFit.scaleDown,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}