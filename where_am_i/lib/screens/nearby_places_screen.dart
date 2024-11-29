import 'package:flutter/material.dart';

class NearbyPlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nearby Places')),
      body: ListView(
        children: [
          ListTile(
            leading:
                Image.asset('assets/images/placeholder_poi.png', width: 40),
            title: Text('Restaurant 1'),
            subtitle: Text('1.2 km away'),
          ),
          ListTile(
            leading:
                Image.asset('assets/images/placeholder_poi.png', width: 40),
            title: Text('Park 2'),
            subtitle: Text('3.5 km away'),
          ),
          // Add more places here
        ],
      ),
    );
  }
}
