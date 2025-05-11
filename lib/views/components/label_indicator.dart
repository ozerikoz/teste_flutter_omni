import 'package:flutter/material.dart';

class LabelIndicator extends StatelessWidget {
  final Function()? onTap;
  final Color color;

  const LabelIndicator({
    super.key,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(6),
      color: color,
      child: InkWell(
        mouseCursor: SystemMouseCursors.click,
        onTap: onTap,
        hoverColor: Colors.white24,
        borderRadius: BorderRadius.circular(6),
        child: SizedBox(
          height: 8,
          width: 36,
        ),
      ),
    );
  }
}
