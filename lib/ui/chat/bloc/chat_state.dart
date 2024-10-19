part of 'chat_bloc.dart';
class ChatState {
  final BlocStateStatus status;
  final List<Map<String, String>> messages; 

  ChatState({
    required this.status,
    required this.messages,
  });

  factory ChatState.initial() => ChatState(
    status: BlocStateStatus.initial,
    messages: [],
  );

  ChatState copyWith({
    BlocStateStatus? status,
    List<Map<String, String>>? messages,
  }) {
    return ChatState(
      status: status?? this.status,
      messages: messages ?? this.messages,
    );
  }
  
}