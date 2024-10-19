import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_scanner/ui/chat/bloc/chat_bloc.dart';
import 'package:skin_scanner/ui/chat/widgets/chat_bubble.dart';
import 'package:skin_scanner/utils/enum.dart';

@RoutePage()
class ChatPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat Page")),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                debugPrint('===State Chat: ${state.status}');
                if (state.status == BlocStateStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == BlocStateStatus.failure) {
                  return const Center(child: Text('Failed to load chat'));
                }
                return ListView.builder(
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: ChatBubble(
                            message: message['user']!,
                            isUser: true,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ChatBubble(
                            message: message['bot']!,
                            isUser: false,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: "Enter your message"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    context
                        .read<ChatBloc>()
                        .add(ChatMessageSent(_controller.text));
                    _controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

