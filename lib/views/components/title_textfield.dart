import 'package:flutter/material.dart';
import 'package:flutter_teste_omni/views/theme/colors.dart';

class TitleTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const TitleTextField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.white1,
      controller: controller,
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
