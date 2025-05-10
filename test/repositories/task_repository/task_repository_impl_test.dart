import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_teste_omni/models/task/task_model.dart';
import 'package:flutter_teste_omni/repositories/task_repository/task_repository_impl.dart';
import 'package:flutter_teste_omni/services/shared_preferences_service.dart';

class MockSharedPreferencesService extends Mock
    implements SharedPreferencesService {}

void main() {
  late MockSharedPreferencesService mockSharedPreferencesService;
  late TaskRepositoryImpl taskRepository;

  const String columnId = 'column-123';

  setUp(() {
    mockSharedPreferencesService = MockSharedPreferencesService();
    taskRepository = TaskRepositoryImpl(
      sharedPreferencesService: mockSharedPreferencesService,
    );
  });

  group('TaskRepositoryImpl', () {
    group('addTask', () {
      test('deve adicionar uma tarefa com sucesso', () async {
        // Arrange
        const taskTitle = 'Nova Tarefa';
        final taskKey = taskRepository.getTaskListKey(columnId);

        when(
          () => mockSharedPreferencesService.getStringList(taskKey),
        ).thenReturn([]);

        when(
          () => mockSharedPreferencesService.setStringList(taskKey, any()),
        ).thenAnswer((_) async => true);

        // Act
        final result = await taskRepository.addTask(
          columnId: columnId,
          taskTitle: taskTitle,
        );

        // Assert
        verify(
          () => mockSharedPreferencesService.getStringList(taskKey),
        ).called(1);

        final captured =
            verify(
              () => mockSharedPreferencesService.setStringList(
                taskKey,
                captureAny(),
              ),
            ).captured;

        expect(captured.isNotEmpty, true);
        final capturedList = captured.first as List<String>;
        expect(capturedList.length, 1);

        final decodedTask = jsonDecode(capturedList.first);
        expect(decodedTask['title'], equals(taskTitle));
        expect(decodedTask['id'], isNotEmpty);

        // Verificar o objeto retornado
        expect(result, isA<Task>());
        expect(result.title, equals(taskTitle));
        expect(result.id, isNotEmpty);
      });
    });

    group('editTask', () {
      test('deve editar uma tarefa existente com sucesso', () async {
        // Arrange
        const taskId = 'task-123';
        const originalTitle = 'Tarefa Original';
        const updatedTitle = 'Tarefa Atualizada';

        final originalTask = Task(id: taskId, title: originalTitle);
        final updatedTask = Task(id: taskId, title: updatedTitle);
        final taskKey = taskRepository.getTaskListKey(columnId);

        when(
          () => mockSharedPreferencesService.getStringList(taskKey),
        ).thenReturn([jsonEncode(originalTask.toJson())]);

        when(
          () => mockSharedPreferencesService.setStringList(taskKey, any()),
        ).thenAnswer((_) async => true);

        // Act
        final result = await taskRepository.editTask(
          columnId: columnId,
          task: updatedTask,
        );

        // Assert
        verify(
          () => mockSharedPreferencesService.getStringList(taskKey),
        ).called(1);

        final captured =
            verify(
              () => mockSharedPreferencesService.setStringList(
                taskKey,
                captureAny(),
              ),
            ).captured;

        expect(captured.isNotEmpty, true);
        final capturedList = captured.first as List<String>;
        expect(capturedList.length, 1);

        final decodedTask = jsonDecode(capturedList.first);
        expect(decodedTask['id'], equals(taskId));
        expect(decodedTask['title'], equals(updatedTitle));

        // Verificar o objeto retornado
        expect(result, isA<Task>());
        expect(result.id, equals(taskId));
        expect(result.title, equals(updatedTitle));
      });
    });

    group('deleteTask', () {
      test('deve remover uma tarefa com sucesso', () async {
        // Arrange
        const taskId = 'task-123';
        const taskTitle = 'Tarefa para Deletar';

        final task = Task(id: taskId, title: taskTitle);
        final taskKey = taskRepository.getTaskListKey(columnId);

        when(
          () => mockSharedPreferencesService.getStringList(taskKey),
        ).thenReturn([jsonEncode(task.toJson())]);

        when(
          () => mockSharedPreferencesService.setStringList(taskKey, any()),
        ).thenAnswer((_) async => true);

        // Act
        await taskRepository.deleteTask(columnId: columnId, taskId: taskId);

        // Assert
        verify(
          () => mockSharedPreferencesService.getStringList(taskKey),
        ).called(1);

        final captured =
            verify(
              () => mockSharedPreferencesService.setStringList(
                taskKey,
                captureAny(),
              ),
            ).captured;

        expect(captured.isNotEmpty, true);
        final capturedList = captured.first as List<String>;
        expect(capturedList, isEmpty);
      });
    });
  });
}
