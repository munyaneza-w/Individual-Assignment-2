// lib/bloc/location_state.dart

import 'package:geolocator/geolocator.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final Position position;

  LocationLoaded(this.position);
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}
