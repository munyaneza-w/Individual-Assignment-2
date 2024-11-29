import 'package:flutter/material.dart';
import 'models/location_model.dart';

class LocationCard extends StatelessWidget {
  final Location location;

  const LocationCard({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(location.name),
        subtitle: Text(location.address),
        leading: Icon(Icons.location_on),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
