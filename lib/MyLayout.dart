import 'package:flutter/material.dart';

class MyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("layout test"),
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          tooltip: '返回',),
      ),
      body: ListView(
        children: [
          Image.asset(
              'images/img1.jpeg',
            height: 240,
            fit: BoxFit.cover,
          ),
          _MiddleLayout(),
          _MyMiddleBtn(),
        ],
      ),
    );
  }
}

class _MiddleLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MiddleState();
}

class _MiddleState extends State<_MiddleLayout>
{
  var _isStart = false;
  var _startCount = 41;

  void _selectStar ()
  {
    setState(() {
      _isStart = !_isStart;
      if ( _isStart )
      {
        _startCount++;
      }
      else
      {
        _startCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var container = Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text("I am Title", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                ),
                Text(
                  'I am Subtitle',
                  style: TextStyle(color: Colors.black26),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _selectStar(),
            child: Icon(
              _isStart ? Icons.star : Icons.star_border,
              size: 30,
              color: _isStart ? Colors.amberAccent : Colors.black12,
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text("$_startCount"),
          ),
        ],
      ),
    );
    return container;
  }
}

class _MyMiddleBtn extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    var btnSection = Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        //平均分配
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildColumnBtn(Icons.call, "CALL"),
          _buildColumnBtn(Icons.near_me, "ROUTE"),
          _buildColumnBtn(Icons.share, "SHARE"),
        ],
      ),
    );

    var textSection = Container(
      padding: EdgeInsets.all(32),
      child: const Text(
        "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. "
            "Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. "
            "A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, "
            "leads you to the lake, which warms to 20 degrees Celsius in the summer. "
            "Activities enjoyed here include rowing, and riding the summer toboggan run.",
        softWrap: true,
      ),
    );

    var columnSection = Column(
      children: [
        btnSection,
        textSection,
      ],
    );

    return columnSection;
  }

  Column _buildColumnBtn ( IconData icon, String label)
  {
    Color color = Colors.blue;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color,),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(color: color, fontSize: 18),
          ),
        ),
      ],
    );
  }

}
