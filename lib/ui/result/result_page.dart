import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResultPage extends StatefulWidget {
  final Map<String, dynamic> serverResponse;

  const ResultPage({super.key, required this.serverResponse});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Predict class: ${widget.serverResponse['predicted_class']}'),
            const SizedBox(height: 20),
            widget.serverResponse['segment_result'] != null
                ? Image.network(widget.serverResponse['segment_result'])
                : Container(),
          ],
        ),
      ),
    );
  }
}