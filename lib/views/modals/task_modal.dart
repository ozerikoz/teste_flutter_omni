import 'package:flutter/material.dart';
import 'package:flutter_teste_omni/models/team/team_model.dart';
import 'package:flutter_teste_omni/models/user/user_model.dart';
import 'package:flutter_teste_omni/views/components/add_label_button.dart';
import 'package:flutter_teste_omni/views/components/add_member_button.dart';
import 'package:flutter_teste_omni/views/components/delete_card_button.dart';
import 'package:flutter_teste_omni/views/components/label.dart';
import 'package:flutter_teste_omni/views/components/title_textfield.dart';
import 'package:flutter_teste_omni/views/components/user_avatar.dart';
import 'package:flutter_teste_omni/views/theme/colors.dart';

class TaskModal extends StatefulWidget {
  final String title;
  final String? description;
  final List<UserModel>? members;
  final List<TeamModel>? teams;

  const TaskModal({
    super.key,
    required this.title,
    this.description,
    this.members,
    this.teams,
  });

  @override
  State<TaskModal> createState() => _TaskModalState();
}

class _TaskModalState extends State<TaskModal> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _descriptionController = TextEditingController(text: widget.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Dialog(
      backgroundColor: Theme.of(context).canvasColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: isMobile ? 8 : 32,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          maxWidth: isMobile ? double.infinity : 768,
        ),
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: TitleTextField(
                          initialValue: "Teste1",
                          onChanged: (_) {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                        ),
                        visualDensity: VisualDensity.compact,
                        iconSize: 24,
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Membros'),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 4,
                                runSpacing: 8,
                                children: [
                                  ...widget.members?.map((member) {
                                        return UserAvatar(
                                          onTap: () {},
                                          imageUrl:
                                              "https://avatar.iran.liara.run/username?username=${member.name}",
                                        );
                                      }).toList() ??
                                      [],
                                  AddMemberButton(
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text('Equipes'),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 4,
                                runSpacing: 8,
                                children: [
                                  ...widget.teams?.map((team) {
                                        return Label(
                                          onTap: () {},
                                          title: team.name,
                                          color: Color(team.colorArgb),
                                        );
                                      }).toList() ??
                                      [],
                                  AddLabelButton(
                                    onTap: () {},
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Icon(
                                    Icons.notes_rounded,
                                    size: 28,
                                  ),
                                  const SizedBox(width: 16),
                                  Text("Descrição"),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 32),
                                child: TextFormField(
                                  cursorColor: AppColors.white1,
                                  minLines: 6,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 16,
                                    ),
                                    filled: true,
                                    fillColor: Theme.of(context)
                                        .colorScheme
                                        .surfaceBright,
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.start,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    alignLabelWithHint: true,
                                    hintText:
                                        "Adicione uma descrição mais detalhada...",
                                  ),
                                  textAlign: TextAlign.start,
                                  onChanged: (_) {},
                                ),
                              ),
                              const SizedBox(height: 16),
                              if (isMobile)
                                DeleteCardButton(
                                  onTap: () {},
                                ),
                            ],
                          ),
                        ),
                        if (!isMobile)
                          DeleteCardButton(
                            onTap: () {},
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
