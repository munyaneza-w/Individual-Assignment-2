import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/asia_screen.dart';
import 'screens/europe_screen.dart';
import 'screens/america_screen.dart';
import 'screens/africa_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Where Am I?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/asia': (context) => AsiaScreen(),
        '/europe': (context) => EuropeScreen(),
        '/america': (context) => AmericaScreen(),
        '/africa': (context) => AfricaScreen(),
      },
    );
  }
}
