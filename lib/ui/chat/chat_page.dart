import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skin_scanner/ui/chat/bloc/chat_bloc.dart';
import 'package:skin_scanner/ui/chat/widgets/chat_bubble.dart';

@RoutePage()
class ChatPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

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
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (_scrollController.hasClients) {
                    _scrollController
                        .jumpTo(_scrollController.position.maxScrollExtent);
                  }
                });
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: state.messages.length + (state.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < state.messages.length) {
                      final message = state.messages[index];
                      return Column(
                        children: [
                          if (message.containsKey('user'))
                            Align(
                              alignment: Alignment.centerRight,
                              child: ChatBubble(
                                message: message['user']!,
                                isUser: true,
                              ),
                            ),
                          if (message.containsKey('bot'))
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ChatBubble(
                                message: message['bot']!,
                                isUser: false,
                              ),
                            ),
                        ],
                      );
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: ListTile(
                          title: Container(
                            width: double.infinity,
                            height: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
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
                    decoration:
                        const InputDecoration(hintText: "Enter your message"),
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
