import 'package:flutter/material.dart';
import 'package:flutter_teste_omni/models/team/team_model.dart';
import 'package:flutter_teste_omni/models/user/user_model.dart';
import 'package:flutter_teste_omni/views/components/add_card_button.dart';
import 'package:flutter_teste_omni/views/components/task_card.dart';
import 'package:flutter_teste_omni/views/components/title_textfield.dart';
import 'package:flutter_teste_omni/views/modals/task_modal.dart';

class BoardColumn extends StatelessWidget {
  final String title;
  final List<String> tasks;

  const BoardColumn({super.key, required this.title, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 272,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      padding: EdgeInsets.fromLTRB(8, 6, 12, 6),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
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
                icon: const Icon(Icons.delete_outline_rounded),
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                iconSize: 16,
                onPressed: () {},
                tooltip: "Deletar coluna.",
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return TaskCard(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return TaskModal(
                                title: "Título da Tarefa",
                                description: "Descrição da tarefa",
                                members: [
                                  UserModel(id: "1", name: "Pedro"),
                                  UserModel(id: "2", name: "João"),
                                ],
                                teams: [
                                  TeamModel(
                                    id: "1",
                                    name: "DESIGN",
                                    colorArgb: 0xFFE74C3C,
                                  ),
                                  TeamModel(
                                    id: "2",
                                    name: "DEV",
                                    colorArgb: 0xFFE74C3C,
                                  ),
                                  TeamModel(
                                    id: "3",
                                    name: "PRODUTO",
                                    colorArgb: 0xFFE74C3C,
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        title: title,
                        description: "Descrição da tarefa",
                        members: [
                          UserModel(id: "1", name: "Pedro"),
                          UserModel(id: "2", name: "João"),
                        ],
                        teams: [
                          TeamModel(
                            id: "1",
                            name: "DESIGN",
                            colorArgb: 0xFFE74C3C,
                          ),
                          TeamModel(
                            id: "2",
                            name: "DEV",
                            colorArgb: 0xFFE74C3C,
                          ),
                          TeamModel(
                            id: "3",
                            name: "PRODUTO",
                            colorArgb: 0xFFE74C3C,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          AddCardButton(onTap: () {}),
        ],
      ),
    );
  }
}
