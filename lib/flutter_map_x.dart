// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map_x/bmf_map_view.dart';
import 'package:flutter_map_x/gms_map_view.dart';

class FlutterMap_x {
  static const MethodChannel _channel = MethodChannel('flutter_map_x');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

abstract class MapView {
  // dart没有interface关键字，因为所有的class默认都是interface
  // Widget get mapView;

  // addMarker;
  addMarker(dynamic markerView);

  /// 添加一个factory构造函数
  // TODO: 2021/11/25 nlm type改成枚举
  factory MapView(String type) {
    if (type == '1') return GmsMapView();
    if (type == '2') return BmfMapView();
    throw 'Can\'t create $type.';
  }

  Widget build(BuildContext context);

  void dispose();
}
