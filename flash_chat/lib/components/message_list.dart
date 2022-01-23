import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

class MessageList extends StatelessWidget {
  MessageList({Key? key}) : super(key: key);

  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            children: snapshot.data!.docs.map(
              (data) {
                var text = data['text'];
                var sender = data['sender'];

                return MessageBubble(text: text, sender: sender);
              },
            ).toList(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              'An error has occurred',
              textAlign: TextAlign.center,
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
