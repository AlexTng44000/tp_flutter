
import 'package:flutter/material.dart';

// Message data model
class ChatMessage {
  final String sender;
  final String preview;
  final Color avatarColor;

  const ChatMessage({
    required this.sender,
    required this.preview,
    required this.avatarColor,
  });
}

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  // List of messages
  static const List<ChatMessage> messages = [
    ChatMessage(
      sender: 'Alice',
      preview: 'Hey! How are you?',
      avatarColor: Colors.blue,
    ),
    ChatMessage(
      sender: 'Bob',
      preview: 'Are you available tomorrow?',
      avatarColor: Colors.green,
    ),
    ChatMessage(
      sender: 'Charlie',
      preview: 'I finished the Flutter project!',
      avatarColor: Colors.orange,
    ),
    ChatMessage(
      sender: 'David',
      preview: 'See you soon!',
      avatarColor: Colors.purple,
    ),
    ChatMessage(
      sender: 'Emma',
      preview: 'Can you send me the files?',
      avatarColor: Colors.teal,
    ),
  ];

  // Build a message item
  Widget buildMessageTile(ChatMessage message) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: message.avatarColor,
        child: Text(
          message.sender[0],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        message.sender,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        message.preview,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(Icons.message_outlined),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Messages'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Builder'),
              Tab(text: 'Separated'),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            // PART 1 - ListView.builder with Divider
            ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    buildMessageTile(messages[index]),

                    // Add a divider between messages
                    if (index < messages.length - 1)
                      const Divider(
                        height: 1,
                        indent: 72,
                      ),
                  ],
                );
              },
            ),

            // PART 2 - ListView.separated
            ListView.separated(
              itemCount: messages.length,

              itemBuilder: (context, index) {
                return buildMessageTile(messages[index]);
              },

              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                  indent: 72,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
