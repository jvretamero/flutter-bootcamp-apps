import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class MessageComposer extends StatelessWidget {
  final Function(String) onMessage;
  final bool isLoading;
  final _controller = TextEditingController();

  MessageComposer({
    Key? key,
    required this.isLoading,
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
              enabled: !isLoading,
              decoration: kMessageTextFieldDecoration,
            ),
          ),
          SizedBox(
            height: 28,
            child: isLoading
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: CircularProgressIndicator(),
                  )
                : TextButton(
                    onPressed: () {
                      onMessage(_controller.text);
                      _controller.clear();
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
