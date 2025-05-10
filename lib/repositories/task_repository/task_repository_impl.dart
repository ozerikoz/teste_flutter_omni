import 'dart:convert';
import 'package:flutter_teste_omni/models/task/task_model.dart';
import 'package:flutter_teste_omni/repositories/task_repository/task_repository.dart';
import 'package:flutter_teste_omni/services/shared_preferences_service.dart';
import 'package:uuid/uuid.dart';

/// Implementação da interface [TaskRepository]
///
/// Utiliza o [SharedPreferencesService] para armazenar e recuperar [Task]s
class TaskRepositoryImpl implements TaskRepository {
  final SharedPreferencesService _sharedPreferencesService;

  TaskRepositoryImpl({
    required SharedPreferencesService sharedPreferencesService,
  }) : _sharedPreferencesService = sharedPreferencesService;

  String getTaskListKey(String columnId) => 'tasks_$columnId';

  @override
  Future<Task> addTask({
    required String columnId,
    required String taskTitle,
  }) async {
    final key = getTaskListKey(columnId);

    final task = Task(id: Uuid().v4(), title: taskTitle);

    try {
      // Recupera a lista atual de tarefas armazenadas
      final currentTasks = _sharedPreferencesService.getStringList(key) ?? [];

      // Adiciona a nova tarefa à lista
      final updated = [...currentTasks, jsonEncode(task.toJson())];

      // Armazena a lista atualizada de tarefas
      await _sharedPreferencesService.setStringList(key, updated);

      // Retorna a tarefa adicionada
      return task;
    } catch (e) {
      throw Exception('Erro ao adicionar a tarefa: $e');
    }
  }

  @override
  Future<void> deleteTask({
    required String columnId,
    required String taskId,
  }) async {
    final key = getTaskListKey(columnId);

    try {
      // Recupera a lista atual de tarefas armazenadas
      final currentTasks = _sharedPreferencesService.getStringList(key) ?? [];

      // Remove a tarefa com o id especificado
      final updated =
          currentTasks.where((taskStr) {
            final decoded = jsonDecode(taskStr);
            return decoded['id'] != taskId;
          }).toList();

      // Armazena a lista atualizada de tarefas
      await _sharedPreferencesService.setStringList(key, updated);
    } catch (e) {
      throw Exception('Erro ao deletar a tarefa $taskId: $e');
    }
  }

  @override
  Future<Task> editTask({required String columnId, required Task task}) async {
    final key = getTaskListKey(columnId);

    try {
      // Recupera a lista atual de tarefas armazenadas
      final currentTasks = _sharedPreferencesService.getStringList(key) ?? [];

      // Atualiza a tarefa com o id especificado
      final updated =
          currentTasks.map((taskStr) {
            final decoded = jsonDecode(taskStr);
            return decoded['id'] == task.id
                ? jsonEncode(task.toJson())
                : taskStr;
          }).toList();

      // Armazena a lista atualizada de tarefas
      await _sharedPreferencesService.setStringList(key, updated);

      // Retorna a tarefa editada
      return task;
    } catch (e) {
      throw Exception('Erro ao editar a tarefa ${task.id}: $e');
    }
  }
}
