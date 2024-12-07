part of 'login_bloc.dart';

class LoginState {
  final BlocStateStatus status;

  LoginState({required this.status});

  factory LoginState.initial() => LoginState(
        status: BlocStateStatus.initial,
      );

  LoginState copyWith({BlocStateStatus? status}) {
    return LoginState(
      status: status ?? this.status,
    );
  }
}
