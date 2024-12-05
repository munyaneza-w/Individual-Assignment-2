import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/location_bloc.dart';
import '../bloc/location_event.dart';
import '../bloc/location_state.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('Location App')),
        body: BlocBuilder<LocationBloc, LocationState>(
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
              ));
            }
            return Center(child: Text('Press the button to get location.'));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Trigger location fetching when the button is pressed
            context.read<LocationBloc>().add(FetchLocation());
          },
          child: Icon(Icons.location_on),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
