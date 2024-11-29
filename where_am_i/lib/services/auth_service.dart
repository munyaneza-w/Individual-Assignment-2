import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/user_model.dart';

class AuthService {
  final String apiUrl =
      "https://example.com/api/auth"; // Replace with your API endpoint

  // Handle user login
  Future<User> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to log in');
    }
  }

  // Handle user signup
  Future<User> signUp(String username, String password, String email) async {
    final response = await http.post(
      Uri.parse('$apiUrl/signup'),
      headers: {'Content-Type': 'application/json'},
      body: json
          .encode({'username': username, 'password': password, 'email': email}),
    );

    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to sign up');
    }
  }
}
