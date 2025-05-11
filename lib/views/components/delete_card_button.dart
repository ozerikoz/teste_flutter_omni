import 'package:flutter/material.dart';

class DeleteCardButton extends StatelessWidget {
  final Function()? onTap;

  const DeleteCardButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: Theme.of(context).filledButtonTheme.style?.copyWith(
            backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.errorContainer,
            ),
          ),
      onPressed: onTap,
      icon: const Icon(Icons.delete_outline_rounded),
      label: const Text("Excluir"),
    );
  }
}
