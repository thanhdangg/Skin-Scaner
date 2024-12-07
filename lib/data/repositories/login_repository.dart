import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_scanner/configs/app_dio.dart';
import 'package:skin_scanner/configs/locator.dart';

class LoginRepository {
  final dio = getIt<AppDio>().dio;

  Future<void> login(String username, String password) async {
    try {
      final response = await dio.post('/login', data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        String token = response.data['token'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
      } else {
        Exception exception = Exception('Login failed');
        throw exception;
      }
    } catch (e) {
      rethrow;
    }
  }
}
