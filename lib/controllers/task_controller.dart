import 'package:get/get.dart';
import 'package:flutter_teste_omni/models/task/task_model.dart';
import 'package:flutter_teste_omni/repositories/task_repository/task_repository_impl.dart';

class TaskController extends GetxController {
  final TaskRepositoryImpl _taskRepository;

  TaskController({required TaskRepositoryImpl taskRepository})
      : _taskRepository = taskRepository;

  final RxMap<String, List<TaskModel>> tasksByColumn =
      <String, List<TaskModel>>{}.obs;

  /// Método para adicionar tarefa
  Future<void> addTask(String columnId, String taskTitle) async {
    try {
      final newTask = await _taskRepository.addTask(
        columnId: columnId,
        taskTitle: taskTitle,
      );

      tasksByColumn[columnId] = [...(tasksByColumn[columnId] ?? []), newTask];
    } catch (e) {
      rethrow;
    }
  }

  /// Método para deletar tarefa
  Future<void> deleteTask(String columnId, String taskId) async {
    try {
      await _taskRepository.deleteTask(
        columnId: columnId,
        taskId: taskId,
      );

      tasksByColumn[columnId] = (tasksByColumn[columnId] ?? [])
          .where((task) => task.id != taskId)
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Método para editar tarefa
  Future<void> editTask(String columnId, TaskModel task) async {
    try {
      final updatedTask = await _taskRepository.editTask(
        columnId: columnId,
        task: task,
      );

      tasksByColumn[columnId] = (tasksByColumn[columnId] ?? []).map((t) {
        return t.id == updatedTask.id ? updatedTask : t;
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  /// Método para reeordenar tarefas
  void updateTaskOrder(String columnId, List<TaskModel> tasks) {
    try {
      _taskRepository.updateTaskColumnOrder(
        columnId: columnId,
        tasks: tasks,
      );

      tasksByColumn[columnId] = tasks;
    } catch (e) {
      rethrow;
    }
  }
}
