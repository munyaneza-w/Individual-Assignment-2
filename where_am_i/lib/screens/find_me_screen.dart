import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindMeScreen extends StatefulWidget {
  @override
  _FindMeScreenState createState() => _FindMeScreenState();
}

class _FindMeScreenState extends State<FindMeScreen> {
  late GoogleMapController mapController;
  late LatLng currentLocation;
  bool isLocationEnabled = false;

  @override
  void initState() {
    super.initState();
    currentLocation =
        LatLng(0.0, 0.0); // Default to (0,0) until user allows location
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _getUserLocation() {
    // This function should get the user's current location
    // Example:
    setState(() {
      currentLocation =
          LatLng(37.7749, -122.4194); // San Francisco as an example
      isLocationEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Find Me')),
      body: Column(
        children: [
          // Google Map
          Expanded(
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: currentLocation, zoom: 14),
              onMapCreated: _onMapCreated,
              markers: {
                Marker(
                  markerId: MarkerId('user_location'),
                  position: currentLocation,
                  icon: BitmapDescriptor.fromAsset(
                      'assets/icons/user_marker.png'),
                ),
              },
            ),
          ),
          // Button to request user location
          ElevatedButton(
            onPressed: _getUserLocation,
            child:
                Text(isLocationEnabled ? 'Location Found' : 'Get My Location'),
          ),
          // Text input for last known place
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Last known place'),
              onChanged: (value) {
                // Store last known place (optional)
              },
            ),
          ),
        ],
      ),
    );
  }
}
