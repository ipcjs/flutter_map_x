import 'package:flutter/material.dart';
import 'package:flutter_map_x/flutter_map_x.dart';
import 'package:flutter_map_x/flutter_marker_x.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GmsMapView implements MapView {
  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) => GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: LatLng(
            52.4478,
            -3.5402,
          ),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {},
        markers: _markers,
      );

  Marker _createMarker() {
    return const Marker(
      markerId: MarkerId("marker_1"),
      position: LatLng(52.4478, -3.5402),
    );
  }

  @override
  addMarker(dynamic markerView) {
    _markers.add(_createMarker());
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
