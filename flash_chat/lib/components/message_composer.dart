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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: isLoading
                ? const SizedBox(
                    width: 40,
                    height: 40,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      onMessage(_controller.text);
                      _controller.clear();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
