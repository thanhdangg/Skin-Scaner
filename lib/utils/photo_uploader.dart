import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skin_scanner/data/repositories/scan_repository.dart';

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
      // Make the request to the server.
      final serverResponse = await _scanRepository.postImageToServer(imageUrl);
      debugPrint('===Server response: $serverResponse');

      // Try to decode the JSON response.
      try {
        // If the server response is expected to be in valid JSON format.
        final decodedResponse = json.decode(serverResponse);
        return decodedResponse;
      } catch (e) {
        debugPrint('===Error decoding server response: $e');
        debugPrint('===Original server response: $serverResponse');

        // Log and rethrow the decoding exception.
        throw Exception(
            'Failed to decode server response: $e. Original response: $serverResponse');
      }
    } catch (error) {
      throw Exception('Failed to send image to server: $error');
    }
  }
}
