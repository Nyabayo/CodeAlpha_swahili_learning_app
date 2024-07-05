import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swahili_learning_app/providers/forum_provider.dart';

class ForumScreen extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final forumProvider = Provider.of<ForumProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Forum'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: forumProvider.fetchMessages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: forumProvider.messages.length,
                  itemBuilder: (context, index) {
                    var message = forumProvider.messages[index]['message'];
                    return ListTile(
                      title: Text(message),
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
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    forumProvider.sendMessage(
                      _messageController.text,
                      'userId', // Replace with the current user's ID
                    );
                    _messageController.clear();
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
