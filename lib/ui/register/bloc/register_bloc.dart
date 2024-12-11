import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:skin_scanner/utils/enum.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final BuildContext context;

  RegisterBloc({required this.context}) : super(RegisterState.initial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: BlocStateStatus.loading));

    try {
      // Simulate an API call (replace with real backend call)
      await Future.delayed(const Duration(seconds: 2));

      // Mock success
      emit(state.copyWith(status: BlocStateStatus.success));
    } catch (error) {
      // Mock failure
      emit(state.copyWith(status: BlocStateStatus.failure));
    }
  }
}
