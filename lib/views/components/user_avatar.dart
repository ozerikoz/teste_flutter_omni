import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final Function()? onTap;
  final String imageUrl;

  const UserAvatar({
    super.key,
    required this.onTap,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: Ink.image(
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover,
        width: 24,
        height: 24,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.white24,
          customBorder: const CircleBorder(),
          mouseCursor: SystemMouseCursors.click,
        ),
      ),
    );
  }
}
