part of 'register_bloc.dart';

class RegisterState {
  final BlocStateStatus status;

  RegisterState({required this.status});

  factory RegisterState.initial() {
    return RegisterState(
      status: BlocStateStatus.initial,
    );
  }

  RegisterState copyWith({BlocStateStatus? status}) {
    return RegisterState(
      status: status ?? this.status,
    );
  }
}
