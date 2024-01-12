import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// A service that stores and retrieves user auth token.
///
/// This class do persist user auth information. 
class AuthService {
  final _storage = new FlutterSecureStorage();

  /// Loads the user's auth token from secure storage.
  /// return empty string if auth token does not exist.
  Future<String> getAuthToken() async {
    String? value = await _storage.read(key: "auth_token");
    return value ?? "";
  }

  /// Persists the user's auth token to local secure storage.
  Future<void> _updateAuthToken(String token) async {
    // Use the secure storage package to persist settings locally
    await _storage.write(key: "auth_token", value: token);
  }

  /// method to sign in
  /// return error message from sign in method
  Future<String> signIn(String pin) async {
    var url = Uri.parse('YOUR_API_ENDPOINT_FOR_SIGNIN'); // Replace with your API endpoint
    var response = await http.post(url, body: {
      'pin' : pin,
    });

    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      String token = data['token']; // Replace with your API response structure
      await _updateAuthToken(token);
    }

    var message = data['message'];

    if (message is String) {
      return message;
    }

    return "Unexpected error";
  }
}
