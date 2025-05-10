import 'package:flutter/material.dart';
import 'package:flutter_teste_omni/models/team/team_model.dart';
import 'package:flutter_teste_omni/models/user/user_model.dart';

class TaskCard extends StatefulWidget {
  final Function()? onTap;
  final String title;
  final String? description;
  final List<UserModel>? members;
  final List<TeamModel>? teams;

  const TaskCard({
    super.key,
    required this.onTap,
    required this.title,
    this.description,
    this.members,
    this.teams,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Material(
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(8),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 80,
              minWidth: 256,
              maxWidth: 256,
            ),
            child: Card(
              color: Theme.of(context).cardColor,
              margin: const EdgeInsets.symmetric(vertical: 4),
              shape: _isHovered
                  ? RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    )
                  : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (widget.teams != null && widget.teams!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Wrap(
                              spacing: 4,
                              runSpacing: 8,
                              children: widget.teams?.map((team) {
                                    return Tooltip(
                                      message: "Equipe: ${team.name}",
                                      child: Container(
                                        height: 8,
                                        width: 36,
                                        decoration: BoxDecoration(
                                          color: Color(team.colorArgb),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                    );
                                  }).toList() ??
                                  [],
                            ),
                          ),
                        Spacer(),
                        Tooltip(
                          message: "Editar cartão",
                          child: Icon(
                            Icons.edit_outlined,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    Text(widget.title,
                        style: Theme.of(context).textTheme.bodyMedium),
                    if (widget.description != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Tooltip(
                          message: "Esse cartão tem uma descrição.",
                          child: Icon(
                            Icons.notes_rounded,
                            size: 16,
                          ),
                        ),
                      ),
                    if (widget.members != null && widget.members!.isNotEmpty)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Wrap(
                            textDirection: TextDirection.rtl,
                            spacing: 4,
                            runSpacing: 8,
                            children: widget.members?.map((member) {
                                  return CircleAvatar(
                                    radius: 12,
                                    backgroundImage: NetworkImage(
                                      "https://avatar.iran.liara.run/username?username=${member.name}",
                                    ),
                                  );
                                }).toList() ??
                                [],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
