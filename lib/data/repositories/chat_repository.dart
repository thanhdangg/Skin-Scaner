import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:skin_scanner/configs/locator.dart';

class ChatRepository {
  final http.Client httpClient;

  ChatRepository() : httpClient = getIt<http.Client>();

  Future<String> sendMessage(String message) async {
    final response = await httpClient.post(
      Uri.parse('https://equal-poorly-mantis.ngrok-free.app/skin-cancer-chatbot'),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'question': message,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      debugPrint('===Response: $data');
      final content = data['answer']['content'];
      final decodedContent = utf8.decode(content.runes.toList());
      return decodedContent;
    } else {
      throw Exception('Failed to load response');
    }
  }
}