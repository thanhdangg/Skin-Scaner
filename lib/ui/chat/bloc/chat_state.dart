part of 'chat_bloc.dart';
class ChatState {
  final BlocStateStatus status;
  final List<Map<String, String>> messages; 
  final bool isLoading;

  ChatState({
    required this.status,
    required this.messages,
    required this.isLoading,
  });

  factory ChatState.initial() => ChatState(
    status: BlocStateStatus.initial,
    messages: [],
    isLoading: false, 
  );

  ChatState copyWith({
    BlocStateStatus? status,
    List<Map<String, String>>? messages,
    bool? isLoading,
  }) {
    return ChatState(
      status: status?? this.status,
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
    );
  }
  
}