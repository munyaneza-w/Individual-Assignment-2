// lib/bloc/location_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart'; // For fetching the location
import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial());

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is FetchLocation) {
      yield LocationLoading(); // Indicating that location is being fetched

      try {
        Position position = await _getLocation();
        yield LocationLoaded(position); // Successfully fetched location
      } catch (e) {
        yield LocationError("Failed to fetch location: $e"); // Error occurred
      }
    }
  }

  // Fetches the current location using Geolocator
  Future<Position> _getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permissions are denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permissions are permanently denied.");
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
