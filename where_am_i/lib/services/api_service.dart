import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/place_model.dart';

class ApiService {
  final String apiUrl =
      "https://example.com/api"; // Replace with your API endpoint

  // Fetch the list of nearby places
  Future<List<Place>> fetchNearbyPlaces(
      double latitude, double longitude) async {
    final response = await http
        .get(Uri.parse('$apiUrl/places?lat=$latitude&lon=$longitude'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((place) => Place.fromJson(place)).toList();
    } else {
      throw Exception('Failed to load nearby places');
    }
  }
}
