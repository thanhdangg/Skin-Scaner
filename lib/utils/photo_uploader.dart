import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skin_scanner/data/repositories/scan_repository.dart';
import 'package:http/http.dart' as http;

class PhotoUploader {
  final ScanRepository _scanRepository = ScanRepository();
  Future<String> uploadImage(String filePath) async {
    try {
      final uploadResponse = await _scanRepository.uploadImage(filePath);
      debugPrint('===Upload response: $uploadResponse');
      return uploadResponse;
    } catch (error) {
      throw Exception('Upload failed: $error');
    }
  }

  Future<Map<String, dynamic>> sendToServer(String imageUrl) async {
    try {
      final serverResponse = await _postImageToServerWithRedirect(imageUrl);
      debugPrint('===Server response: $serverResponse');

      try {
        final decodedResponse = json.decode(serverResponse);
        return decodedResponse;
      } catch (e) {
        debugPrint('===Error decoding server response: $e');
        debugPrint('===Original server response: $serverResponse');
        throw Exception(
            'Failed to decode server response: $e. Original response: $serverResponse');
      }
    } catch (error) {
      throw Exception('Failed to send image to server: $error');
    }
  }

  Future<String> _postImageToServerWithRedirect(String imageUrl) async {
    try {
      final http.Response response =
          (await _scanRepository.postImageToServer(imageUrl)) as http.Response;
      if (response.statusCode == 307) {
        final redirectUrl = response.headers['location'];
        if (redirectUrl != null) {
          debugPrint('===Redirecting to: $redirectUrl');
          return _postImageToServerWithRedirect(redirectUrl);
        } else {
          throw Exception('Redirect location is missing');
        }
      }
      return response.body;
    } catch (error) {
      debugPrint('===Error posting image to server: $error');
      throw Exception('Failed to post image to server: $error');
    }
  }
}
