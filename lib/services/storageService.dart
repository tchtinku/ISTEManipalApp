import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final storage = new FlutterSecureStorage();
  Future<void> storeTokenAndUser(user) async {
    await storage.write(key: "token", value: user['token']);
    await storage.write(key: "username", value: user['username']);
    await storage.write(key: "email", value: user['email']);
    await storage.write(key: "first_name", value: user['first_name']);
    await storage.write(key: "last_name", value: user['last_name']);
  }

  Future<dynamic> getTokenAndUser() async {
    Map<String, String> tokenAndUser = await storage.readAll();
    print(tokenAndUser);
    return tokenAndUser;
  }

  Future<void> deleteAllData() async {
    await storage.deleteAll();
  }
}
