/**
 *    这是一个提供全局变量的类
 */
class MyGlobal
{
  static var mainStr = <String>[];

  static Future init() async
  {
    mainStr.add("我的第一个应用");
    mainStr.add("图片");
    mainStr.add("animated list");
    mainStr.add("AppBarBottomSample");
    mainStr.add("BasicAppBarSample");
    mainStr.add("ExpansionTile");
    mainStr.add("TabbedAppBarSample");
    // mainStr.add("图片");
  }

}