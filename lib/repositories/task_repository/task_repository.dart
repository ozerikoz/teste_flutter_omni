import 'package:flutter_teste_omni/models/task/task_model.dart';

/// Interface para TaskRepository
abstract class TaskRepository {
  /// Método para adicionar uma [Task]
  Future<TaskModel> addTask({
    required String columnId,
    required String taskTitle,
  });

  /// Método para editar uma [Task]
  Future<TaskModel> editTask({
    required String columnId,
    required TaskModel task,
  });

  /// Método para deletar uma [Task]
  Future<void> deleteTask({required String columnId, required String taskId});
}
