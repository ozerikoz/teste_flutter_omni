import 'package:flutter/material.dart';
import 'package:flutter_teste_omni/views/theme/colors.dart';

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
      cursorColor: AppColors.white1,
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
