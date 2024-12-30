import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_scanner/data/repositories/history_repository.dart';
import 'package:skin_scanner/ui/history/bloc/history_bloc.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<HistoryBloc>().add(FetchHistory());

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Center(
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            debugPrint('===HistoryBloc state: $state');
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.error != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: ${state.error}'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HistoryBloc>().add(FetchHistory());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (state.predictions.isEmpty) {
              return const Center(child: Text('No history found.'));
            } else {
              return ListView.builder(
                itemCount: state.predictions.length,
                itemBuilder: (context, index) {
                  final prediction = state.predictions[index];
                  final segmentImage = prediction['segment_image'] ?? '';
                  final rawImage = prediction['raw_image'] ?? '';
                  final predictionResult =
                      prediction['prediction_result'] ?? 'Unknown';
                  final userId = prediction['user_id'] ?? 'N/A';

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                if (segmentImage.isNotEmpty)
                                  Expanded(
                                    child: Image.network(
                                      segmentImage,
                                      fit: BoxFit.cover,
                                      height: 150,
                                    ),
                                  )
                                else
                                  const Expanded(
                                    child: Icon(
                                      Icons.image_not_supported,
                                      size: 50,
                                    ),
                                  ),
                                const SizedBox(width: 10),
                                if (rawImage.isNotEmpty)
                                  Expanded(
                                    child: Image.network(
                                      rawImage,
                                      fit: BoxFit.cover,
                                      height: 150,
                                    ),
                                  )
                                else
                                  const Expanded(
                                    child: Icon(
                                      Icons.image_not_supported,
                                      size: 50,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Prediction: $predictionResult',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
