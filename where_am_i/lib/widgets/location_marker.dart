import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationMarker extends StatelessWidget {
  final double latitude;
  final double longitude;

  const LocationMarker({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      markers: [
        Marker(
          point: LatLng(latitude, longitude),
          builder: (context) {
            return Icon(
              Icons.location_pin,
              color: Colors.red,
              size: 30,
            );
          },
        ),
      ],
    );
  }
}
