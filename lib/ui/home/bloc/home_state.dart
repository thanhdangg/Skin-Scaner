part of 'home_bloc.dart';

class HomeState {
  final BlocStateStatus status;

  HomeState({required this.status});

  factory HomeState.initial() => HomeState(
    status: BlocStateStatus.initial,
  );

  HomeState copyWith({
    BlocStateStatus? status,
  }) {
    return HomeState(
      status: status?? this.status,
    );
  }
}