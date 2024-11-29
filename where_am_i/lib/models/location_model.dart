class Location {
  final double latitude;
  final double longitude;
  final String name;
  final String address;

  Location({
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.address,
  });

  // Convert a JSON object to a Location instance
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'],
      longitude: json['longitude'],
      name: json['name'],
      address: json['address'],
    );
  }
}
