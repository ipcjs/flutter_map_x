
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_map_x/flutter_marker_x.dart';

class BmfMarkerView implements MarkerView {

  @override
  get markerView => BMFMarker(
        position: BMFCoordinate(39.928617, 116.40329),
        title: 'flutterMaker',
        identifier: 'flutter_marker',
        icon: "example/assets/icon/icon_mark.png",
      );
  
}