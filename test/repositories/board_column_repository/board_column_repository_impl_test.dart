import "dart:convert";
import "package:flutter_test/flutter_test.dart";
import "package:flutter_teste_omni/models/board_column/board_column_model.dart";
import "package:flutter_teste_omni/models/task/task_model.dart";
import "package:flutter_teste_omni/repositories/board_column_repository/board_column_repository_impl.dart";
import "package:flutter_teste_omni/services/shared_preferences_service.dart";
import "package:mocktail/mocktail.dart";

class MockSharedPreferencesService extends Mock
    implements SharedPreferencesService {}

void main() {
  group("BoardColumnRepositoryImpl", () {
    late MockSharedPreferencesService mockSharedPreferencesService;
    late BoardColumnRepositoryImpl repository;

    const String testBoardId = "test-board-id";

    setUp(() {
      mockSharedPreferencesService = MockSharedPreferencesService();
      repository = BoardColumnRepositoryImpl(
        sharedPreferencesService: mockSharedPreferencesService,
      );

      // Setup respostas padrão para os métodos do MockSharedPreferencesService
      when(
        () => mockSharedPreferencesService.getStringList(any()),
      ).thenAnswer((_) => []);
      when(
        () => mockSharedPreferencesService.getString(any()),
      ).thenAnswer((_) => "");
      when(
        () => mockSharedPreferencesService.setStringList(any(), any()),
      ).thenAnswer((_) async => Future<void>.value());
      when(
        () => mockSharedPreferencesService.setString(any(), any()),
      ).thenAnswer((_) async => Future<void>.value());
      when(
        () => mockSharedPreferencesService.remove(any()),
      ).thenAnswer((_) async => Future<void>.value());
    });

    /// Testes para o método addBoardColumn
    group("addBoardColumn", () {
      test("deve adicionar uma coluna ao board", () async {
        // Arrange
        final columnListKey = repository.getColumnListKey(testBoardId);

        const String columnTitle = "New Column";

        when(
          () => mockSharedPreferencesService.getStringList(columnListKey),
        ).thenReturn([]);

        // Act
        await repository.addBoardColumn(
          boardId: testBoardId,
          boardColumnTitle: columnTitle,
        );

        // Assert
        verify(
          () => mockSharedPreferencesService.getStringList(columnListKey),
        ).called(1);

        final List<String> capturedList =
            verify(
                  () => mockSharedPreferencesService.setStringList(
                    columnListKey,
                    captureAny<List<String>>(),
                  ),
                ).captured.first
                as List<String>;

        expect(capturedList.length, 1);

        final Map<String, dynamic> decodedColumn = jsonDecode(
          capturedList.first,
        );
        expect(decodedColumn["title"], columnTitle);
        expect(decodedColumn["tasks"], isEmpty);
      });

      test("deve adicionar outra coluna ao board", () async {
        // Arrange
        final columnListKey = repository.getColumnListKey(testBoardId);

        const String columnTitle = "Existing Column";
        const String columnId = "existing-id";

        when(
          () => mockSharedPreferencesService.getStringList(columnListKey),
        ).thenReturn([]);

        final existingColumn = BoardColumnModel(
          id: columnId,
          title: columnTitle,
          tasks: [],
        );

        when(
          () => mockSharedPreferencesService.getStringList(columnListKey),
        ).thenReturn([jsonEncode(existingColumn.toJson())]);

        // Act
        await repository.addBoardColumn(
          boardId: testBoardId,
          boardColumnTitle: columnTitle,
        );

        // Assert
        final List<String> capturedList =
            verify(
                  () => mockSharedPreferencesService.setStringList(
                    columnListKey,
                    captureAny<List<String>>(),
                  ),
                ).captured.first
                as List<String>;

        expect(capturedList.length, 2);

        final Map<String, dynamic> decodedExistingColumn = jsonDecode(
          capturedList.first,
        );
        expect(decodedExistingColumn["id"], columnId);
        expect(decodedExistingColumn["title"], columnTitle);

        final Map<String, dynamic> decodedNewColumn = jsonDecode(
          capturedList[1],
        );
        expect(decodedNewColumn["title"], columnTitle);
      });
    });

    /// Testes para o método editBoardColumn
    group("editBoardColumn", () {
      test("deve editar uma coluna do board", () async {
        // Arrange
        final columnListKey = repository.getColumnListKey(testBoardId);

        const String columnTitle = "Original Title";
        const String columnUpdatedTitle = "Updated Title";
        const String columnId = "existing-id";

        final originalColumn = BoardColumnModel(
          id: columnId,
          title: columnTitle,
          tasks: [
            TaskModel(id: "task-id-1", title: "task-title-1"),
            TaskModel(id: "task-id-2", title: "task-title-2"),
          ],
        );

        final updatedColumn = BoardColumnModel(
          id: columnId,
          title: columnUpdatedTitle,
          tasks: [
            TaskModel(id: "task-id-1", title: "task-title-1"),
            TaskModel(id: "task-id-2", title: "task-title-2"),
          ],
        );

        when(
          () => mockSharedPreferencesService.getStringList(columnListKey),
        ).thenReturn([jsonEncode(originalColumn.toJson())]);

        // Act
        await repository.editBoardColumn(
          boardId: testBoardId,
          boardColumn: updatedColumn,
        );

        // Assert
        final List<String> capturedList =
            verify(
                  () => mockSharedPreferencesService.setStringList(
                    columnListKey,
                    captureAny<List<String>>(),
                  ),
                ).captured.first
                as List<String>;

        expect(capturedList.length, 1);

        final Map<String, dynamic> decodedColumn = jsonDecode(
          capturedList.first,
        );

        expect(decodedColumn["id"], columnId);
        expect(decodedColumn["title"], columnUpdatedTitle);
      });
    });

    /// Testes para o método deleteBoardColumn
    group("deleteBoardColumn", () {
      test("deve deletar uma coluna do board", () async {
        // Arrange
        final columnListKey = repository.getColumnListKey(testBoardId);

        const String columnTitle = "Delete Me";
        const String columnId = "delete-id";

        final columnToDelete = BoardColumnModel(
          id: columnId,
          title: columnTitle,
          tasks: [
            TaskModel(id: "task-id-1", title: "task-title-1"),
            TaskModel(id: "task-id-2", title: "task-title-2"),
          ],
        );

        when(
          () => mockSharedPreferencesService.getStringList(columnListKey),
        ).thenReturn([jsonEncode(columnToDelete.toJson())]);

        // Act
        await repository.deleteBoardColumn(
          boardId: testBoardId,
          boardColumnId: columnId,
        );

        // Assert
        final List<String> capturedList =
            verify(
                  () => mockSharedPreferencesService.setStringList(
                    columnListKey,
                    captureAny<List<String>>(),
                  ),
                ).captured.first
                as List<String>;

        expect(capturedList, isEmpty);
      });
    });

    /// Testes para o método fetchBoardColumns
    group("fetchBoardColumns", () {
      test("deve retornar as colunas do board", () {
        // Arrange
        final columnListKey = repository.getColumnListKey(testBoardId);

        final column1 = BoardColumnModel(
          id: "column-1",
          title: "Column 1",
          tasks: [],
        );

        final column2 = BoardColumnModel(
          id: "column-2",
          title: "Column 2",
          tasks: [TaskModel(id: "task-1", title: "Task 1")],
        );

        when(
          () => mockSharedPreferencesService.getStringList(columnListKey),
        ).thenReturn([
          jsonEncode(column1.toJson()),
          jsonEncode(column2.toJson()),
        ]);

        // Act
        final result = repository.fetchBoardColumns(boardId: testBoardId);

        // Assert
        expect(result.length, 2);
        expect(result[0].id, "column-1");
        expect(result[0].title, "Column 1");
        expect(result[0].tasks, isEmpty);

        expect(result[1].id, "column-2");
        expect(result[1].title, "Column 2");
        expect(result[1].tasks.length, 1);
        expect(result[1].tasks[0].id, "task-1");
        expect(result[1].tasks[0].title, "Task 1");
      });
    });
  });
}
