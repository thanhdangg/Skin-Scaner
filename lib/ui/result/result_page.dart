import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skin_scanner/configs/app_color.dart';

@RoutePage()
class ResultPage extends StatelessWidget {
  final Map<String, dynamic> serverResponse;

  const ResultPage({Key? key, required this.serverResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the class names
    final classNames = [
      "akiec - Actinic keratoses",
      "bcc - Basal cell carcinoma",
      "bkl - Benign keratosis-like lesions",
      "df - Dermatofibroma",
      "nv - Melanocytic nevi",
      "vasc - Pyogenic granulomas",
      "mel - Melanoma",
    ];

    final label = serverResponse['label'] ?? 'Unknown';
    final predictionProbabilities =
        (serverResponse['prediction_probabilities'] as List?)?.cast<double>() ??
            [];

    final segmentResultUrl = serverResponse['segment_result'] ?? '';
    final attributeResult = serverResponse['attribute_result'] ?? {};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Detected Class: $label',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Prediction Probabilities:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Display class names with their probabilities in cards
            if (predictionProbabilities.isNotEmpty)
              Column(
                children: List.generate(classNames.length, (index) {
                  final isDetectedClass = classNames[index]
                      .toLowerCase()
                      .contains(label.toLowerCase());
                  return Card(
                    color: isDetectedClass ? Colors.teal[50] : Colors.grey[100],
                    elevation: isDetectedClass ? 4 : 2,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            classNames[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: isDetectedClass
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isDetectedClass
                                  ? AppColor.primaryColor
                                  : Colors.black87,
                            ),
                          ),
                          Text(
                            '${(predictionProbabilities[index] * 100).toStringAsFixed(2)}%',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isDetectedClass
                                  ? Colors.teal[800]
                                  : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              )
            else
              const Text(
                'No probabilities available.',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            const SizedBox(height: 20),
            if (segmentResultUrl.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Segment Result:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        segmentResultUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                    ),
                  ),
                ],
              )
            else
              const Text(
                'No segment result available.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            const SizedBox(height: 20),
            if (attributeResult.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Attribute Results:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...attributeResult.entries.map((entry) {
                    final attributeName = entry.key;
                    final attributeImage = entry.value;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            attributeName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Image.network(
                            attributeImage,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image_not_supported, size: 50),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
