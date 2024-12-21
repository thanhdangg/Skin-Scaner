import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_scanner/data/repositories/login_repository.dart';
import 'package:skin_scanner/utils/enum.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final BuildContext context;

  LoginBloc({required this.context}) : super(LoginState.initial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    final loginRepository = LoginRepository();

    emit(state.copyWith(status: BlocStateStatus.loading));
    try {
      await loginRepository.login(event.username, event.password);
      emit(state.copyWith(status: BlocStateStatus.success));
    } catch (_) {
      emit(state.copyWith(status: BlocStateStatus.failure));
    }
  }
}
