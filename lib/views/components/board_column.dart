import 'package:flutter/material.dart';
import 'package:flutter_teste_omni/controllers/board_controller.dart';
import 'package:flutter_teste_omni/models/board_column/board_column_model.dart';
import 'package:flutter_teste_omni/models/task/task_model.dart';
import 'package:flutter_teste_omni/views/components/add_card_button.dart';
import 'package:flutter_teste_omni/views/components/task_card.dart';
import 'package:flutter_teste_omni/views/components/title_textfield.dart';
import 'package:flutter_teste_omni/views/modals/task_modal.dart';
import 'package:get/get.dart';

class BoardColumn extends StatefulWidget {
  final int? index;
  final BoardColumnModel column;
  final Function(TaskModel task, String columnTitle) onTaskMoved;

  const BoardColumn({
    super.key,
    required this.index,
    required this.column,
    required this.onTaskMoved,
  });

  @override
  State<BoardColumn> createState() => _BoardColumnState();
}

class _BoardColumnState extends State<BoardColumn> {
  late BoardController boardController;
  late TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    boardController = Get.find<BoardController>();
    titleController = TextEditingController(text: widget.column.title);
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<TaskModel>(
      onAcceptWithDetails: (details) {
        widget.onTaskMoved(details.data, widget.column.title);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 272,
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
                      controller: titleController,
                      onChanged: (title) {
                        boardController.editColumn(
                          widget.column.copyWith(title: title),
                        );
                      },
                    ),
                  ),
                  if (widget.index != null && widget.index! > 0)
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.delete_outline_rounded),
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                          iconSize: 16,
                          onPressed: () {
                            boardController.deleteColumn(widget.column.id);
                          },
                          tooltip: "Deletar coluna.",
                        ),
                      ],
                    ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shrinkWrap: true,
                        itemCount: widget.column.tasks.length,
                        itemBuilder: (context, index) {
                          final task = widget.column.tasks[index];

                          return Draggable<TaskModel>(
                            childWhenDragging: const SizedBox(),
                            data: task,
                            feedback: Material(
                              color: Colors.transparent,
                              child: TaskCard(
                                onTap: () {},
                                title: task.title,
                                description: task.description ?? "",
                                members: task.members ?? [],
                                teams: task.teams ?? [],
                              ),
                            ),
                            child: TaskCard(
                              onTap: () {
                                showTaskModal(context, task);
                              },
                              title: task.title,
                              description: task.description ?? "",
                              members: task.members ?? [],
                              teams: task.teams ?? [],
                            ),
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
      },
    );
  }

  void showTaskModal(BuildContext context, TaskModel task) {
    showDialog(
      context: context,
      builder: (context) {
        return TaskModal(
          title: task.title,
          teams: task.teams,
          members: task.members,
          description: task.description,
        );
      },
    );
  }
}
