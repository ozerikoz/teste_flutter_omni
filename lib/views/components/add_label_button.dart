import 'package:flutter/material.dart';

class AddLabelButton extends StatelessWidget {
  final Function()? onTap;

  const AddLabelButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceBright,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        mouseCursor: SystemMouseCursors.click,
        onTap: onTap,
        hoverColor: Colors.white24,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 4,
          ),
          child: Icon(
            Icons.add_rounded,
            size: 20,
          ),
        ),
      ),
    );
  }
}
