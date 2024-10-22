import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_scanner/data/repositories/chat_repository.dart';
import 'package:skin_scanner/utils/enum.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final BuildContext context;

  ChatBloc({required this.context}) : super(ChatState.initial()) {
    on<ChatMessageSent>(_onChatMessageSent);
  }
  Future<void> _onChatMessageSent(
      ChatMessageSent event, Emitter<ChatState> emit) async {
    // Emit loading state
    emit(
      state.copyWith(
        status: BlocStateStatus.loading,
        messages: List.from(state.messages)..add({'user': event.message}),
        isLoading: true,
      ),
    );
    final chatRepository = ChatRepository();

    try {
      // Use the repository to send the message
      final botResponse = await chatRepository.sendMessage(event.message);

      // Emit success state with updated messages
      emit(state.copyWith(
        status: BlocStateStatus.success,
        messages: List.from(state.messages)..add({'bot': botResponse}),
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BlocStateStatus.failure,
        messages: List.from(state.messages)..add({'bot': e.toString()}),
        isLoading: false,
      ));
    }
  }
}
