import 'package:flutter/material.dart';

class AddMemberButton extends StatelessWidget {
  final Function()? onTap;

  const AddMemberButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceBright,
        borderRadius: BorderRadius.circular(25),
      ),
      width: 24,
      height: 24,
      child: IconButton(
        hoverColor: Colors.white24,
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: Icon(
          Icons.add,
          size: 16,
        ),
      ),
    );
  }
}
