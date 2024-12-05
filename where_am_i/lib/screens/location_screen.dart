// lib/screens/location_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/location_bloc.dart';
import '../bloc/location_event.dart';
import '../bloc/location_state.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location App'),
      ),
      body: BlocProvider(
        create: (context) => LocationBloc()
          ..add(FetchLocation()), // Fetch location when screen loads
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            if (state is LocationLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LocationLoaded) {
              return Center(
                child: Text(
                  'Location: ${state.position.latitude}, ${state.position.longitude}',
                  style: TextStyle(fontSize: 18),
                ),
              );
            } else if (state is LocationError) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            return Center(child: Text('Press to get location.'));
          },
        ),
      ),
    );
  }
}
