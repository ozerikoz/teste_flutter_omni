import "package:flutter_teste_omni/models/board_column/board_column_model.dart";
import "package:get/get.dart";
import "package:flutter_teste_omni/repositories/board_column_repository/board_column_repository_impl.dart";
import "package:flutter_teste_omni/services/shared_preferences_service.dart";

class BoardController extends GetxController {
  final RxList<BoardColumnModel> boardColumns;
  final BoardColumnRepositoryImpl repository;

  final RxBool isLoading = false.obs;

  BoardController({List<BoardColumnModel> initialColumns = const []})
      : boardColumns = RxList(initialColumns),
        repository = BoardColumnRepositoryImpl(
          sharedPreferencesService: Get.find<SharedPreferencesService>(),
        );

  // Método para editar a coluna
  void editColumn(BoardColumnModel updatedColumn) {
    try {
      final index = boardColumns.indexWhere(
        (col) => col.id == updatedColumn.id,
      );

      if (index != -1) {
        boardColumns[index] = updatedColumn;
        repository.editBoardColumn(
          boardId: "default-board-id",
          boardColumn: updatedColumn,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  // Método para excluir uma coluna
  void deleteColumn(String columnId) {
    try {
      boardColumns.removeWhere((col) => col.id == columnId);

      repository.deleteBoardColumn(
        boardId: "default-board-id",
        boardColumnId: columnId,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Método para adicionar uma nova coluna
  void addColumn(BoardColumnModel newColumn) {
    try {
      isLoading.value = true;

      repository.addBoardColumn(
        boardId: "default-board-id",
        boardColumnTitle: newColumn.title,
      );

      final updatedColumns =
          repository.fetchBoardColumns(boardId: "default-board-id");

      boardColumns.assignAll(updatedColumns);
    } catch (e) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  // Método para obter todas as colunas
  List<BoardColumnModel> getColumns() {
    try {
      isLoading.value = true;

      final columns = repository.fetchBoardColumns(boardId: "default-board-id");

      if (columns.isEmpty) {
        // Se não houver colunas, adiciona uma coluna padrão
        final defaultColumn = BoardColumnModel(
          id: "default-column-id",
          title: "Backlog",
          tasks: [],
        );

        columns.add(defaultColumn);

        repository.addBoardColumn(
          boardId: "default-board-id",
          boardColumnTitle: defaultColumn.title,
        );
      }

      boardColumns.assignAll(columns);
      return columns;
    } catch (e) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  void onReorder(int oldIndex, int newIndex) {
    if (oldIndex == 0 || newIndex == 0) {
      return;
    }

    final column = boardColumns.removeAt(oldIndex);

    boardColumns.insert(newIndex, column);

    // Atualiza a ordem das colunas no repositório
    repository.updateBoardColumnOrder(
      boardId: "default-board-id",
      columns: boardColumns,
    );
  }
}
