import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EuropeScreen extends StatefulWidget {
  @override
  _EuropeScreenState createState() => _EuropeScreenState();
}

class _EuropeScreenState extends State<EuropeScreen> {
  String _location = "Fetching your location...";
  late GoogleMapController mapController;
  Set<Marker> _markers = Set<Marker>();
  LatLng _initialPosition = LatLng(48.8566, 2.3522); // Default to Paris, France

  @override
  void initState() {
    super.initState();
  }

  Future<void> _getLocation() async {
    try {
      // Get current device location
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _initialPosition = LatLng(position.latitude, position.longitude);
        _markers.add(Marker(
          markerId: MarkerId('currentLocation'),
          position: _initialPosition,
          infoWindow: InfoWindow(title: 'Your Location'),
        ));
        _location =
            "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
      });

      // Fetch location details (city, country) from API
      String url =
          'http://api.ipstack.com/${position.latitude},${position.longitude}?access_key=03f83579-3f64-4f1b-810c-7e1f378ac9c3';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          _location = "${data['city']}, ${data['country_name']}";
        });
      } else {
        setState(() {
          _location = "Failed to fetch location info";
        });
      }
    } catch (e) {
      setState(() {
        _location = "Error fetching location: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map Background
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 6.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            markers: _markers,
            onMapCreated: (controller) {
              mapController = controller;
            },
          ),
          // Content Overlay (Text and Button)
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Your Location in Europe:',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black54,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  _location,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    backgroundColor: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // "Find Me" Button
          Positioned(
            bottom: 30,
            right: 20,
            child: ElevatedButton(
              onPressed: _getLocation,
              child: Text("Find Me"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
