import 'package:flutter/material.dart';

import '../bmi_theme.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  final bool? isSelected;
  final Function? onSelected;

  const CardContainer({
    Key? key,
    required this.child,
    this.isSelected,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected?.call();
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: (isSelected ?? true) ? BMITheme.activeCardColor : BMITheme.inactiveCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
