import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyAnimation extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
        leading: IconButton(onPressed: ()=>Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          tooltip: '返回',
        ),
      ),
      body: AnimationLogo(),
    );
  }
}

class AnimationLogo extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()=> _AnimationLogoState();
}

class _AnimationLogoState extends State<AnimationLogo> with SingleTickerProviderStateMixin
{

  late Animation<double> _animation;
  late AnimationController _controller;

  var strStatus="";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    _animation = (Tween(begin: 0.0, end: 100.0).animate(_controller)..addListener(() {
      //监听动画执行， 更新UI
      setState(() {
      });
    })..addStatusListener((status) {
      setState(() {
        strStatus += status.toString()+"\n";
        //  监听动画状态， 反复执行
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }

      });
      // Scaffold.of(context).showBottomSheet((context) => Text("status:$status"));
    })) as Animation<double>;
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      // scrollDirection: Axis.horizontal,  横向滚动(布局)
      scrollDirection: Axis.vertical,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text("AnimationStatus:\n$strStatus"),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: _animation.value,
            height: _animation.value,
            child: FlutterLogo(),
          ),
        ),
        AnimateLogo(animation: _controller, key: Key(""),),
      ],
    );
  }
}
//并行动画
class AnimateLogo extends AnimatedWidget
{
  static final _opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 100.0);

  AnimateLogo({required Key key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: _sizeTween.evaluate(animation),
          height: _sizeTween.evaluate(animation),
          child: FlutterLogo(),
        ),
      ),
    );
  }

}

