import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset('assets/images/home_background.png',
                fit: BoxFit.cover),
          ),

          // Main content area
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App logo
                  Image.asset('assets/images/app_logo.png', height: 150),
                  SizedBox(height: 30),

                  // Introduction text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Welcome to Where Am I!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'This app helps you know your current location in a new place.\n'
                      'For example, if it\'s your first time in Kigali, the app will help you find out where you are and share that information with others. '
                      'You can also track the places you\'ve been to and easily navigate to them.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),

                  // Login and Sign Up Buttons
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/login'); // Navigate to Login Screen
                    },
                    child: Text('Log In'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/signup'); // Navigate to Sign Up Screen
                    },
                    child: Text('Sign Up'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Optional: Navigation buttons for "Find Me" and "Nearby Places"
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/findme'); // Navigate to Find Me Screen
                    },
                    child: Text('Find Me'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                          '/nearby'); // Navigate to Nearby Places Screen
                    },
                    child: Text('Nearby Places'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
