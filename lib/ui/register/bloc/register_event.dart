part of 'register_bloc.dart';

abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final String username;
  final String password;
  final String email;

  RegisterSubmitted(this.username, this.password, this.email);
}
