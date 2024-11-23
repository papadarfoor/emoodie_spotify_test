import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  final storage = const FlutterSecureStorage();

  Future<void> setToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async => await storage.read(key: 'token');

  Future<Map<String, dynamic>> toHeader() async {
    final token = await getToken();
    return {'Authorization': 'Bearer ${token ?? ""}'};
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'token');
  }
}
