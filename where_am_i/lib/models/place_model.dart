class Place {
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  Place({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  // Convert a JSON object to a Place instance
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
