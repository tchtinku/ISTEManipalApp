import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _storage = new FlutterSecureStorage();
  Future<void> storeTokenAndUser(user) async {
    await _storage.write(key: "token", value: user['token']);
    await _storage.write(key: "username", value: user['username']);
    await _storage.write(key: "email", value: user['email']);
    await _storage.write(key: "first_name", value: user['first_name']);
    await _storage.write(key: "last_name", value: user['last_name']);
  }

  Future<dynamic> getTokenAndUser() async {
    Map<String, String> tokenAndUser = await _storage.readAll();
    return tokenAndUser;
  }

  Future<void> deleteAllUserData() async {
    await _storage.delete(key: "token");
    await _storage.delete(key: "username");
    await _storage.delete(key: "email");
    await _storage.delete(key: "first_name");
    await _storage.delete(key: "last_name");
  }

  Future<String> getHeaders() async {
    String token = await _storage.read(key: 'token');
    String headers = 'Token $token';
    return headers;
  }

  //for storing theme related info
  Future<void> storeThemeIndex(index) async {
    await _storage.write(key: 'themeIndex', value: index.toString());
  }

  Future<int> getThemeIndex() async {
    String themeIndex = await _storage.read(key: 'themeIndex');
    if (themeIndex == null) {
      return 0;
    }
    return int.parse(themeIndex);
  }
}
