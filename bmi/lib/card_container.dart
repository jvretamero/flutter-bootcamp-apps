import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget? child;
  final Color? color;

  const CardContainer({
    Key? key,
    this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
