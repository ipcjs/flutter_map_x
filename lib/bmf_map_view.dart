import 'package:flutter/material.dart';
import 'package:flutter_map_x/flutter_map_x.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';

class BmfMapView implements MapView {
  @override
  Widget get mapView => BMFMapWidget(
        onBMFMapCreated: onBMFMapCreated,
        mapOptions: _initMapOptions(),
      );

  late BMFMapController myMapController;

  /// 设置地图参数
  BMFMapOptions _initMapOptions() {
    BMFMapOptions mapOptions = BMFMapOptions(
      center: BMFCoordinate(39.917215, 116.380341),
      zoomLevel: 12,
    );
    return mapOptions;
  }

  /// 创建完成回调
  void onBMFMapCreated(BMFMapController controller) {
    myMapController = controller;

    /// 地图加载回调
    myMapController.setMapDidLoadCallback(callback: () {
      print('mapDidLoad-地图加载完成');
    });
  }
}
