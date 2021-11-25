import 'package:flutter/material.dart';
import 'package:flutter_map_x/flutter_map_x.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';

class BmfMapView implements MapView {
  final page = const BmfMapViewPage();

  @override
  Widget build(BuildContext context) => page;

  @override
  addMarker(dynamic markerView) {}

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

class BmfMapViewPage extends StatefulWidget {
  const BmfMapViewPage({Key? key}) : super(key: key);

  @override
  _BmfMapViewPageState createState() => _BmfMapViewPageState();
}

class _BmfMapViewPageState extends State<BmfMapViewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BMFMapWidget(
      onBMFMapCreated: onBMFMapCreated,
      mapOptions: _initMapOptions(),
    );
  }

  late BMFMapController myMapController;

  /// 设置地图参数
  BMFMapOptions _initMapOptions() {
    BMFMapOptions mapOptions = BMFMapOptions(
      center: BMFCoordinate(39.917215, 116.380341),
      zoomLevel: 15,
    );
    return mapOptions;
  }

  /// 创建完成回调
  void onBMFMapCreated(BMFMapController controller) {
    myMapController = controller;

    _addMarker1();

    /// 地图加载回调
    myMapController.setMapDidLoadCallback(callback: () {
      print('mapDidLoad-地图加载完成');
    });
  }

  /// 添加大头针
  _addMarker1() {
    BMFMarker marker = BMFMarker(
        position: BMFCoordinate(39.928617, 116.40329),
        title: 'flutterMaker',
        subtitle: 'test',
        identifier: 'flutter_marker',
        icon: 'assets/icon/icon_mark.png');
    // bool result;
    myMapController.addMarker(marker);
  }
}
