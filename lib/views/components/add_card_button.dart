import 'package:flutter/material.dart';

class AddCardButton extends StatelessWidget {
  final Function()? onTap;

  const AddCardButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 12, 6),
          child: Row(
            children: [
              Icon(
                Icons.add,
                size: 16,
                color: Theme.of(context).iconTheme.color,
              ),
              const SizedBox(width: 4),
              Text(
                'Adicionar tarefa',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
