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
    return tokenAndUser;
  }

  Future<void> deleteAllUserData() async {
    await storage.delete(key: "token");
    await storage.delete(key: "username");
    await storage.delete(key: "email");
    await storage.delete(key: "first_name");
    await storage.delete(key: "last_name");
  }

  //for storing theme related info
  Future<void> storeThemeIndex(index) async {
    await storage.write(key: 'themeIndex', value: index.toString());
  }

  Future<int> getThemeIndex() async {
    String themeIndex = await storage.read(key: 'themeIndex');
    if (themeIndex == null) {
      return 0;
    }
    return int.parse(themeIndex);
  }
}
