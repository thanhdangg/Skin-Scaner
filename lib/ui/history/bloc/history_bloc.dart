import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_scanner/data/repositories/history_repository.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepository historyRepository;

  HistoryBloc({required this.historyRepository}) : super(HistoryState.initial()) {
    on<FetchHistory>(_onFetchHistory);
  }

  Future<void> _onFetchHistory(FetchHistory event, Emitter<HistoryState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final predictions = await historyRepository.getHistory();
      emit(state.copyWith(isLoading: false, predictions: predictions));
    } catch (error) {
      emit(state.copyWith(isLoading: false, error: error.toString()));
    }
  }
}
