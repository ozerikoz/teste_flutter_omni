import 'package:flutter/material.dart';

class TitleTextField extends StatelessWidget {
  final String initialValue;
  final Function(String)? onChanged;

  const TitleTextField({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      mouseCursor: SystemMouseCursors.click,
      style: Theme.of(context).textTheme.bodyLarge,
      minLines: 1,
      maxLines: 10,
      onChanged: onChanged,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
