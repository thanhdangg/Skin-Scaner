import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_scanner/configs/locator.dart';

class ScanRepository {
  final http.Client httpClient;
  ScanRepository() : httpClient = getIt<http.Client>();

  Future<String> uploadImage(String filePath) async {
    const cloudinaryUrl =
        'https://api.cloudinary.com/v1_1/djwsawehq/image/upload';
    const uploadPreset = 'PBL6_dang_cuong_trong';
    try {
      FormData formData = FormData.fromMap({
        'upload_preset': uploadPreset,
        'file': await MultipartFile.fromFile(filePath),
      });
      // Send POST request to Cloudinary
      Response response = await dio.post(cloudinaryUrl, data: formData);
      if (response.statusCode == 200) {
        return response.data['url'].toString();
      } else {
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      throw Exception('Failed to upload image');
    }
  }
  Future<String> postImageToServer(String url) async {
    // const serverUrl = 'https://lab-moving-grizzly.ngrok-free.app/predict/';
    const serverUrl = 'https://z94n3sz2-80.asse.devtunnels.ms/predict';

    try {
      // Retrieve userId from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('userId');

      if (userId == null) {
        throw Exception('User ID not found in SharedPreferences');
      }

      final response = await http.post(
        Uri.parse(serverUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'url': url,
          'userid': '1',
        }),
      );

      if (response.statusCode == 200) {
        // Print raw server response for debugging
        debugPrint("===serverResponse.body: ${response.body}");

        // Check if response.body is already a string or needs to be encoded
        final responseBody = response.body;
        if (responseBody.startsWith('{') && responseBody.endsWith('}')) {
          // If the response is a JSON string, return it as is
          return responseBody;
        } else {
          throw Exception('Unexpected response format from server');
        }
      } else {
        throw Exception('Failed to post image to server. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint("===Error posting image to server: $e");
      throw Exception('Failed to post image to server: $e');
    }
  }
  // Future<String> postImageToServer(String url) async {
  //   const serverUrl = 'https://lab-moving-grizzly.ngrok-free.app/predict/';
  //   try {
  //     // Retrieve userId from SharedPreferences
  //     final prefs = await SharedPreferences.getInstance();
  //     final userId = prefs.getInt('userId');

  //     if (userId == null) {
  //       throw Exception('User ID not found in SharedPreferences');
  //     }

  //     final response = await http.post(
  //       Uri.parse(serverUrl),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode({
  //         'url': url,
  //         'userid': userId,
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       // Print raw server response for debugging
  //       debugPrint("===serverResponse.body: ${response.body}");

  //       // Check if response.body is already a string or needs to be encoded
  //       final responseBody = response.body;
  //       if (responseBody.startsWith('{') && responseBody.endsWith('}')) {
  //         // If the response is a JSON string, return it as is
  //         return responseBody;
  //       } else {
  //         throw Exception('Unexpected response format from server');
  //       }
  //     } else {
  //       throw Exception('Failed to post image to server. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     debugPrint("===Error posting image to server: $e");
  //     throw Exception('Failed to post image to server: $e');
  //   }
  // }

  // Future<String> postImageToServer(String url) async {
  //   const serverUrl = 'https://lab-moving-grizzly.ngrok-free.app/predict';
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     final userId = prefs.getInt('userId');

  //     if (userId == null) {
  //       throw Exception('User ID not found in SharedPreferences');
  //     }
      
  //     Response serverResponse = await dio.post(
  //       serverUrl,
  //       data: {
  //         'url': url,
  //         'userid': userId,
  //       },
  //     );
  //     if (serverResponse.statusCode == 200) {
  //       // Print raw server response for debugging
  //       debugPrint("===serverResponse.data: ${serverResponse.data}");

  //       // Check if serverResponse.data is already a string or needs to be encoded
  //       if (serverResponse.data is Map) {
  //         // If the response is a Map, it's likely JSON, so return the JSON as a string
  //         return json.encode(serverResponse.data);
  //       } else if (serverResponse.data is String) {
  //         // If the response is already a string, return it as is
  //         return serverResponse.data;
  //       } else {
  //         throw Exception('Unexpected response format from server');
  //       }
  //     } else {
  //       throw Exception(
  //           'Failed to post image to server. Status code: ${serverResponse.statusCode}');
  //     }
  //   } catch (e) {
  //     debugPrint("===Error posting image to server: $e");
  //     throw Exception('Failed to post image to server: $e');
  //   }
  // }
}
