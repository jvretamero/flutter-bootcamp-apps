import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;

  const MessageBubble({
    Key? key,
    required this.text,
    required this.sender,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(20);

    Radius topLeftRadius = isMe ? radius : Radius.zero;
    Radius topRightRadius = isMe ? Radius.zero : radius;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 3),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: topLeftRadius,
              topRight: topRightRadius,
              bottomLeft: radius,
              bottomRight: radius,
            ),
            elevation: 3,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
