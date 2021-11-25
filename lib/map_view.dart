import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as g;

/// Created by ipcjs on 2021/11/25.
class MapView extends StatefulWidget {
  const MapView({
    required this.mapType,
    Key? key,
    required this.onMapCreated,

    /// 声明式添加圆
    required this.circles,
  }) : super(key: key);

  final MapType mapType;
  final void Function(MapController controller) onMapCreated;
  final Set<LatLng> circles;

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late final GoogleMapController _googleMapController;
  BaiduMapController? _baiduMapController;

  @override
  void initState() {
    super.initState();
    _googleMapController = GoogleMapController(() {
      setState(() {
        /* 触发rebuild */
      });
    });
  }

  @override
  void didUpdateWidget(covariant MapView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.circles != oldWidget.circles) {
      _baiduMapController?.refreshMarkers(circles: widget.circles);
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.mapType) {
      case MapType.baidu:
        return _buildBaidu(context);
      case MapType.google:
        return _buildGoogle(context);
    }
  }

  Widget _buildGoogle(BuildContext context) {
    return g.GoogleMap(
      initialCameraPosition: g.CameraPosition(
        target: g.LatLng(0, 0),
      ),
      markers: _googleMapController._markers,
      circles: widget.circles
          .map((it) => g.Circle(
                circleId: g.CircleId('default'),
                center: g.LatLng(it.lat, it.lng),
              ))
          .toSet(),
      onMapCreated: (controller) {
        _googleMapController.onControllerCreated(controller);
        widget.onMapCreated(_googleMapController);
      },
    );
  }

  Widget _buildBaidu(BuildContext context) {
    return BMFMapWidget(
      onBMFMapCreated: (controller) {
        widget.onMapCreated(_baiduMapController = BaiduMapController(controller));
      },
    );
  }
}

class LatLng {
  LatLng(this.lat, this.lng);

  final double lat;
  final double lng;
}

enum MapType { baidu, google }

abstract class MapController {
  void addMarker(double lat, double lng);
}

class BaiduMapController extends MapController {
  BaiduMapController(this._controller);

  final BMFMapController _controller;

  @override
  void addMarker(double lat, double lng) {
    _controller.addMarker(BMFMarker(
      position: BMFCoordinate(lat, lng),
      icon: "/xxx",
    ));
  }

  void refreshMarkers({required Set<LatLng> circles}) {
    _controller.cleanAllMarkers();
    for (final it in circles) {
      _controller.addCircle(BMFCircle(center: BMFCoordinate(it.lat, it.lng), radius: 10));
    }
  }
}

class GoogleMapController extends MapController {
  GoogleMapController(this.rebuild);

  final void Function() rebuild;

  final Set<g.Marker> _markers = {};

  late final g.GoogleMapController _controller;

  void onControllerCreated(g.GoogleMapController controller) {
    _controller = controller;
  }

  /// 命令式添加marker
  @override
  void addMarker(double lat, double lng) {
    _markers.add(g.Marker(
      markerId: g.MarkerId("default"),
      position: g.LatLng(lat, lng),
    ));
    rebuild();
  }
}
