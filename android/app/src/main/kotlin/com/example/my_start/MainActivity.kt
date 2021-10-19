package com.example.my_start

import android.content.*
import android.os.BatteryManager
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {

//    private val BATTERY_CHANNEL = "samples.flutter.io/battery"
//    private val CHARGING_CHANNEL = "samples.flutter.io/charging"
//
//    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//        EventChannel(flutterEngine.getDartExecutor(), CHARGING_CHANNEL).setStreamHandler(
//            object : EventChannel.StreamHandler {
//                private var chargingStateChangeReceiver: BroadcastReceiver? = null
//
//                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
//                    events?.let {
//                        chargingStateChangeReceiver = createChargingStateChangeReceiver(it)
//                        registerReceiver(
//                            chargingStateChangeReceiver, IntentFilter(Intent.ACTION_BATTERY_CHANGED)
//                        )
//                    }
//
//                }
//
//                override fun onCancel(arguments: Any?) {
//                    unregisterReceiver(chargingStateChangeReceiver)
//                    chargingStateChangeReceiver = null
//                }
//
//            }
//        )
//        MethodChannel(flutterEngine.getDartExecutor(), BATTERY_CHANNEL).setMethodCallHandler(
//            object : MethodChannel.MethodCallHandler{
//            override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
//                if (call.method.equals("getBatteryLevel")) {
//                    val batteryLevel = getBatteryLevel()
//                    if (batteryLevel != -1) {
//                        result.success(batteryLevel)
//                    } else {
//                        result.error("UNAVAILABLE", "Battery level not available.", null)
//                    }
//                } else {
//                    result.notImplemented()
//                }
//            }
//
//        })
//    }
//
//    private fun createChargingStateChangeReceiver(events: EventChannel.EventSink): BroadcastReceiver? {
//        return object : BroadcastReceiver() {
//
//            override fun onReceive(context: Context?, intent: Intent) {
//                val status: Int = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1)
//                if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
//                    events.error("UNAVAILABLE", "Charging status unavailable", null)
//                } else {
//                    val isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
//                            status == BatteryManager.BATTERY_STATUS_FULL
//                    events.success(if (isCharging) "charging" else "discharging")
//                }
//            }
//        }
//    }
//
//    private fun getBatteryLevel(): Int {
//        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
//            val batteryManager: BatteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
//            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
//        } else {
//            val intent: Intent = ContextWrapper(getApplicationContext()).registerReceiver(
//                null,
//                IntentFilter(Intent.ACTION_BATTERY_CHANGED)
//            )!!
//            intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 /
//                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
//        }
//    }

}
