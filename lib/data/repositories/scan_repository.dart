import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skin_scanner/configs/locator.dart';

class ScanRepository {
  final http.Client httpClient;
  ScanRepository() : httpClient = getIt<http.Client>();

  Future<String> uploadImage(String filePath) async {
    const cloudinaryUrl =
        'https://api.cloudinary.com/v1_1/djwsawehq/image/upload';
    const uploadPreset = 'PBL6_dang_cuong_trong';
    try{
      FormData formData = FormData.fromMap({
        'upload_preset': uploadPreset,
        'file': await MultipartFile.fromFile(filePath),
      });
      // Send POST request to Cloudinary
      Response response = await dio.post(cloudinaryUrl, data: formData);
      if (response.statusCode == 200){
        return response.data['url'].toString();
      }
      else {
        throw Exception('Failed to upload image');
      }
    }
    catch(e){
      throw Exception('Failed to upload image');
    }
  }

  Future<String> postImageToServer(String url) async {
  const serverUrl = 'http://52.189.253.232/predict/';
  try {
    Response serverResponse = await dio.post(
      serverUrl,
      data: {
        'url': url,
      },
    );
    if (serverResponse.statusCode == 200) {
      // Print raw server response for debugging
      debugPrint("===serverResponse.data: ${serverResponse.data}");

      // Check if serverResponse.data is already a string or needs to be encoded
      if (serverResponse.data is Map) {
        // If the response is a Map, it's likely JSON, so return the JSON as a string
        return json.encode(serverResponse.data);
      } else if (serverResponse.data is String) {
        // If the response is already a string, return it as is
        return serverResponse.data;
      } else {
        throw Exception('Unexpected response format from server');
      }
    } else {
      throw Exception('Failed to post image to server. Status code: ${serverResponse.statusCode}');
    }
  } catch (e) {
    debugPrint("===Error posting image to server: $e");
    throw Exception('Failed to post image to server: $e');
  }
}

}