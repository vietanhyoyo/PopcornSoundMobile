import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:popcorn_sound_mobile/constants/local.dart';

class SecureStorage {
  // define secure storage
  final secureStorage = const FlutterSecureStorage();

  // define key
  final String accessToken = LocalConstant.accessToken;

  Future<void> saveToken(dynamic value) async {
    return await secureStorage.write(key: accessToken, value: value);
  }

  Future<String?> getToken() {
    return secureStorage.read(key: accessToken);
  }

  Future<bool> hasToken() async {
    bool hasToken = await secureStorage.containsKey(key: accessToken);
    return hasToken;
  }

  /// Delete token
  Future<void> deleteToken() async {
    return await secureStorage.delete(key: accessToken);
  }

  Future<void> saveUserId(dynamic value) async {
    return await secureStorage.write(key: "userId", value: value);
  }

  Future<String?> getUserId() {
    return secureStorage.read(key: "userId");
  }
}
