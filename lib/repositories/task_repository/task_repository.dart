import 'package:flutter_teste_omni/models/task/task_model.dart';

/// Interface para TaskRepository
abstract interface class TaskRepository {
  /// Método para adicionar uma [Task]
  Future<Task> addTask({required String columnId, required String taskTitle});

  /// Método para editar uma [Task]
  Future<Task> editTask({required String columnId, required Task task});

  /// Método para deletar uma [Task]
  Future<void> deleteTask({required String columnId, required String taskId});
}
