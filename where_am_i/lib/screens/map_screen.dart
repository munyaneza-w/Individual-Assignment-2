import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/location_bloc.dart';
import '../bloc/location_event.dart';
import '../bloc/location_state.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationBloc()..add(FetchLocation()),
      child: Scaffold(
        appBar: AppBar(title: Text('Location App')),
        body: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            if (state is LocationLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LocationLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Location: ${state.position.latitude}, ${state.position.longitude}',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Add action to refresh location
                        context.read<LocationBloc>().add(FetchLocation());
                      },
                      child: Text('Refresh Location'),
                    ),
                  ],
                ),
              );
            } else if (state is LocationError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Add action to refresh location
                        context.read<LocationBloc>().add(FetchLocation());
                      },
                      child: Text('Try Again'),
                    ),
                  ],
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
