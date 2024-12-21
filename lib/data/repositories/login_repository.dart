import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_scanner/configs/app_dio.dart';
import 'package:skin_scanner/configs/locator.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<int> login(String username, String password) async {
    final url = Uri.parse('https://lab-moving-grizzly.ngrok-free.app/login');
    final response = await _sendPostRequest(url, username, password);

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return responseBody['userid'];
    } else {
      throw Exception('Failed to login: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }

  Future<int> register(String username, String password) async {
    final url = Uri.parse('https://lab-moving-grizzly.ngrok-free.app/register');
    final response = await _sendPostRequest(url, username, password);

    if (response.statusCode == 201) {
      final responseBody = jsonDecode(response.body);
      debugPrint('User created successfully: ${responseBody['message']}');
      return responseBody['userid'];
    } else {
      throw Exception('Failed to register: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }

  Future<http.Response> _sendPostRequest(Uri url, String username, String password) async {
    debugPrint('Sending request to: $url');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );
    debugPrint('Response: ${response.statusCode} - ${response.reasonPhrase}');

    if (response.statusCode == 307) {
      final redirectUrl = response.headers['location'];
      if (redirectUrl != null) {
        debugPrint('Redirecting to: $redirectUrl');
        return _sendPostRequest(Uri.parse(redirectUrl), username, password);
      } else {
        throw Exception('Redirect location is missing');
      }
    }

    return response;
  }
}

// class LoginRepository {
//   final dio = getIt<AppDio>().dio;

//   Future<void> login(String username, String password) async {
//     try {
//       debugPrint('Starting login request...');
//       final fullUrl = '${dio.options.baseUrl}/login';
//       debugPrint('Sending request to: $fullUrl');

//       final response = await dio.post('/login', data: {
//         'username': username,
//         'password': password,
//       });
//       debugPrint('Login response: ${response.data}');

//       if (response.statusCode == 200) {
//         String? userid = response.data['userid']?.toString();
//         if (userid == null) {
//           debugPrint('Invalid response format: userid is null');
//           throw Exception('Invalid response format: userid is null');
//         }

//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('userid', userid);
//       } else {
//         debugPrint('Login failed: ${response.statusMessage}');
//         throw Exception('Login failed: ${response.statusMessage}');
//       }
//     } on DioException catch (dioError) {
//       if (dioError.response != null) {
//         debugPrint('API Error: ${dioError.response?.statusCode} - ${dioError.response?.statusMessage}');
//         throw Exception(
//             'API Error: ${dioError.response?.statusCode} - ${dioError.response?.statusMessage}');
//       } else {
//         debugPrint('Connection Error: ${dioError.message}');
//         throw Exception('Connection Error: ${dioError.message}');
//       }
//     } catch (e) {
//       debugPrint('Unexpected error: $e');
//       throw Exception('Unexpected error: $e');
//     }
//   }
// }
