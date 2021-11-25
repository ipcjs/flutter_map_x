import 'package:flutter/material.dart';
import 'package:flutter_map_x/bmf_marker_view.dart';
import 'package:flutter_map_x/gms_marker_view.dart';

abstract class MarkerView {
  dynamic get markerView;

  // 添加一个factory构造函数
  factory MarkerView(String type) {
    if (type == '1') return GmsMarkerView();
    if (type == '2') return BmfMarkerView();
    throw 'Can\'t create $type.';
  }
}