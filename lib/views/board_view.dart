import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_teste_omni/models/team/team_model.dart';
import 'package:flutter_teste_omni/models/user/user_model.dart';
import 'package:flutter_teste_omni/views/components/board_column.dart';
import 'package:flutter_teste_omni/models/board_column/board_column_model.dart';
import 'package:flutter_teste_omni/models/task/task_model.dart';

class BoardView extends StatefulWidget {
  const BoardView({super.key});

  @override
  State<BoardView> createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  List<BoardColumnModel> boardColumns = [
    BoardColumnModel(
      id: '1',
      title: 'To Do',
      tasks: [
        TaskModel(
            id: '1',
            title: 'Task 1',
            description: "dwandioaiwda",
            members: [
              UserModel(id: "1", name: "USER 1"),
              UserModel(id: "2", name: "USER 2"),
            ],
            teams: [
              TeamModel(
                id: "1",
                name: "ux",
                colorArgb: Colors.red.toARGB32(),
              ),
              TeamModel(
                id: "1",
                name: "ux",
                colorArgb: Colors.blue.toARGB32(),
              ),
            ]),
        TaskModel(
            id: '1',
            title: 'Task 2',
            description: "dwandioaiwda",
            members: [
              UserModel(id: "1", name: "USER 1"),
              UserModel(id: "2", name: "USER 2"),
            ],
            teams: [
              TeamModel(
                id: "1",
                name: "ux",
                colorArgb: Colors.red.toARGB32(),
              ),
              TeamModel(
                id: "1",
                name: "ux",
                colorArgb: Colors.blue.toARGB32(),
              ),
            ]),
        TaskModel(id: '3', title: 'Task 3'),
      ],
    ),
    BoardColumnModel(
      id: '2',
      title: 'In Progress',
      tasks: [
        TaskModel(id: '4', title: 'Task 4'),
        TaskModel(id: '5', title: 'Task 5'),
      ],
    ),
    BoardColumnModel(
      id: '3',
      title: 'Done',
      tasks: [
        TaskModel(id: '6', title: 'Task 6'),
      ],
    ),
  ];

  // Método para mover o card de uma coluna para outra
  void moveTask(TaskModel task, String newColumnTitle) {
    setState(() {
      // Cria uma cópia mutável da lista de colunas
      boardColumns = boardColumns.map((column) {
        if (column.tasks.contains(task)) {
          // Remove a tarefa da coluna atual
          final updatedTasks = List<TaskModel>.from(column.tasks)..remove(task);
          return column.copyWith(tasks: updatedTasks);
        }
        return column;
      }).toList();

      // Adiciona a tarefa à nova coluna
      boardColumns = boardColumns.map((column) {
        if (column.title == newColumnTitle) {
          final updatedTasks = List<TaskModel>.from(column.tasks)..add(task);
          return column.copyWith(tasks: updatedTasks);
        }
        return column;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Teste Omni Saúde - Board 1',
        ),
      ),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
            },
          ),
          child: Scrollbar(
            child: ReorderableListView.builder(
              primary: true,
              clipBehavior: Clip.none,
              buildDefaultDragHandles: false,
              scrollDirection: Axis.horizontal,
              onReorder: onReorder,
              itemCount: boardColumns.length,
              prototypeItem: BoardColumn(
                index: 0,
                column: BoardColumnModel(id: '', title: '', tasks: []),
                onTaskMoved: moveTask,
              ),
              proxyDecorator: (child, index, animation) {
                return Material(
                  color: Colors.transparent,
                  child: child,
                );
              },
              itemBuilder: (context, index) {
                return ReorderableDelayedDragStartListener(
                  index: index,
                  key: ValueKey(boardColumns[index]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    child: BoardColumn(
                      index: index,
                      column: boardColumns[index],
                      onTaskMoved: moveTask,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex == 0 || newIndex == 0) {
        return;
      }
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final column = boardColumns.removeAt(oldIndex);
      boardColumns.insert(newIndex, column);
    });
  }
}
