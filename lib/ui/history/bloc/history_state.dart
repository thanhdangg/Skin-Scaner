part of 'history_bloc.dart';

class HistoryState {
  final bool isLoading;
  final List<Map<String, dynamic>> predictions;
  final String? error;

  HistoryState({
    required this.isLoading,
    required this.predictions,
    this.error,
  });

  factory HistoryState.initial() {
    return HistoryState(
      isLoading: false,
      predictions: [],
      error: null,
    );
  }

  HistoryState copyWith({
    bool? isLoading,
    List<Map<String, dynamic>>? predictions,
    String? error,
  }) {
    return HistoryState(
      isLoading: isLoading ?? this.isLoading,
      predictions: predictions ?? this.predictions,
      error: error,
    );
  }
}