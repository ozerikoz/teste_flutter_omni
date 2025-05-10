import 'package:flutter/material.dart';
import 'package:flutter_teste_omni/models/user/user_model.dart';
import 'package:flutter_teste_omni/views/components/add_card_button.dart';
import 'package:flutter_teste_omni/views/components/task_card.dart';
import 'package:flutter_teste_omni/views/components/title_textfield.dart';

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
          ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            shrinkWrap: true,
            primary: false,
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(
                onTap: () {},
                title: title,
                description: "Descrição da tarefa",
                members: [
                  UserModel(id: "DWADWAD", name: "pedro"),
                  UserModel(id: "DWADWAD", name: "jao"),
                  UserModel(id: "DWADWAD", name: "jao"),
                ],
                teams: [
                  // TeamModel(id: "dwadwa", name: "time1", colorArgb: 4282198599),
                  // TeamModel(id: "dwadwa", name: "time2", colorArgb: 4292131163),
                  // TeamModel(id: "dwadwa", name: "time2", colorArgb: 4282953266),
                ],
              );
            },
          ),
          Spacer(),
          AddCardButton(onTap: () {}),
        ],
      ),
    );
  }
}
