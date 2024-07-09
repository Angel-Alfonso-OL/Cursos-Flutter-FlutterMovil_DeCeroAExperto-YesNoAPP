import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/model/entity/message.dart';
import 'package:yes_no_app/views/chat/her_message_bubble.dart';
import 'package:yes_no_app/views/chat/my_message_bubble.dart';
import 'package:yes_no_app/views/providers/chat_provider.dart';
import 'package:yes_no_app/views/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
        toolbarHeight: 70,
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://www.sandiegouniontribune.com/wp-content/uploads/migration/2021/11/12/0000017d-117d-dd2a-a1ff-59ffcc970001.jpg?w=535"),
          ),
        ),
        title: const Text("Mi Amor"),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrolController,
                  itemCount: chatProvider.messages.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messages[index];
                    return (message.fromWho == FromWho.hers)
                        ? HerMessageBubble(message: message)
                        : MyMessageBubble(message: message);
                  },
                ),
              ),
              MessageFieldBox(
                onValue: (value) => chatProvider.sendMessage(value),
              )
            ],
          ),
        ),
      ),
    );
  }
}
