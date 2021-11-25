import 'package:flutter/material.dart';
import 'package:flutter_map_x/flutter_map_x.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GmsMapView implements MapView {
  @override
  Widget get mapView => GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: const CameraPosition(
          target: LatLng(
            37.42796133580664,
            -122.085749655962,
          ),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {},
      );
}
