import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class MessageComposer extends StatelessWidget {
  final Function(String) onMessage;
  final _controller = TextEditingController();

  MessageComposer({
    Key? key,
    required this.onMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kMessageContainerDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: kMessageTextFieldDecoration,
            ),
          ),
          TextButton(
            onPressed: () {
              onMessage(_controller.text);
              _controller.clear();
            },
            child: const Text(
              'Send',
              style: kSendButtonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
