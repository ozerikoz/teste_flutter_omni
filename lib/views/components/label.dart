import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final Color color;

  const Label({
    super.key,
    required this.onTap,
    this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(4),
      color: color,
      child: InkWell(
        mouseCursor: SystemMouseCursors.click,
        hoverColor: Colors.white24,
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            title ?? "",
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
