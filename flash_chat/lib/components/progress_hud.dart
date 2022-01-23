import 'package:flutter/material.dart';

class ProgressHud extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const ProgressHud({
    Key? key,
    required this.child,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Stack(
        children: [
          child,
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.grey,
            ),
          ),
          const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        ],
      );
    }

    return child;
  }
}
