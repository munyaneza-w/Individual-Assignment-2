import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AmericaScreen extends StatefulWidget {
  @override
  _AmericaScreenState createState() => _AmericaScreenState();
}

class _AmericaScreenState extends State<AmericaScreen> {
  String _location = "Fetching your location...";
  late GoogleMapController mapController;
  Set<Marker> _markers = Set<Marker>();
  LatLng _initialPosition =
      LatLng(37.7749, -122.4194); // Default to San Francisco, USA

  @override
  void initState() {
    super.initState();
  }

  Future<void> _getLocation() async {
    try {
      // Get the current device location
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Update the map position and the location text
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

      // Fetch the location info (city and country) from the API
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
                  'Your Location in America:',
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: Text("Find Me"),
            ),
          ),
        ],
      ),
    );
  }
}
