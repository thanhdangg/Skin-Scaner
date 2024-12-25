import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_scanner/data/repositories/history_repository.dart';
import 'package:skin_scanner/ui/history/bloc/history_bloc.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Center(
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
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
                  final predictionResult = prediction['prediction_result'] ?? 'Unknown';
                  final userId = prediction['user_id'] ?? 'N/A';

                  return ListTile(
                    leading: segmentImage.isNotEmpty
                        ? Image.network(segmentImage)
                        : const Icon(Icons.image_not_supported),
                    title: Text(predictionResult),
                    subtitle: Text('User ID: $userId'),
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
