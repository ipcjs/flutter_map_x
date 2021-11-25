import 'package:flutter_map_x/flutter_marker_x.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GmsMarkerView implements MarkerView {
  @override
  get markerView => const Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(52.4478, -3.5402),
      );
}