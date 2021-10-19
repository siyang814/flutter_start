
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/***
 *    目前存在的问题， 导致导入插件无法使用， 需要在 activity里注释掉代码。。。插件才能使用， 了解太少， 还不知道如何解决。。
 */
class PlatformChannel extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PlatformChannel"),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: MyChannel(),
    );
  }
}

class MyChannel extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return MyChannelState();
  }
}

class MyChannelState extends State<MyChannel>
{
  static const MethodChannel methodChannel =
  MethodChannel('samples.flutter.io/battery');
  static const EventChannel eventChannel =
  EventChannel('samples.flutter.io/charging');

  String _batteryLevel = 'Battery level: unknown.';
  String _chargingStatus = 'Battery status: unknown.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int? result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%.';
    } on PlatformException {
      batteryLevel = 'Failed to get battery level.';
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  void initState() {
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
    super.initState();
  }

  void _onEvent(Object? event) {
    setState(() {
      _chargingStatus =
      "Battery status: ${event == 'charging' ? '' : 'dis'}charging.";
    });
  }

  void _onError(Object error) {
    setState(() {
      _chargingStatus = 'Battery status: unknown.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_batteryLevel, key: const Key('Battery level label')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _getBatteryLevel,
                  child: const Text('Refresh'),
                ),
              ),
            ],
          ),
          Text(_chargingStatus),
        ],
      ),
    );
  }

}