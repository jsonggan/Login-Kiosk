import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A service that stores and retrieves api token and necessary api information.
///
/// This class do persist api token. 
class ApiService {
  final _storage = new FlutterSecureStorage();

  /// Loads the api token from secure storage.
  /// return empty string if api token does not exist.
  Future<String> getApiToken() async {
    String? value = await _storage.read(key: "api_token");
    return value ?? "";
  }
}
