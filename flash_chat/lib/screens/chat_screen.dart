import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/message_composer.dart';
import 'package:flash_chat/components/message_list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const route = '/chat';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future _messageFuture = Future.value();

  String get _currentUser => _auth.currentUser?.email ?? 'undefined';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: MessageList(
                currentUser: _currentUser,
              ),
            ),
            FutureBuilder(
              future: _messageFuture,
              builder: (context, snapshot) {
                return MessageComposer(
                  isLoading:
                      snapshot.connectionState == ConnectionState.waiting,
                  onMessage: (message) async {
                    setState(() {
                      _messageFuture = _firestore.collection('messages').add({
                        'text': message,
                        'sender': _currentUser,
                        'date': DateTime.now().toUtc()
                      });
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
