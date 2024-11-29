import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart'; // Add your login screen
import 'signup_screen.dart'; // Add your signup screen
import 'find_me_screen.dart';
import 'nearby_places_screen.dart';

void main() {
  runApp(WhereAmIApp());
}

class WhereAmIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Where Am I',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(), // Define your Login Screen
        '/signup': (context) => SignUpScreen(), // Define your Sign Up Screen
        '/findme': (context) => FindMeScreen(),
        '/nearby': (context) => NearbyPlacesScreen(),
      },
    );
  }
}
