import "package:flutter_teste_omni/models/board_column/board_column_model.dart";
import "package:get/get.dart";
import "package:flutter_teste_omni/repositories/board_column_repository/board_column_repository_impl.dart";

class BoardController extends GetxController {
  final BoardColumnRepositoryImpl _boardColumnRepository;

  BoardController({required BoardColumnRepositoryImpl boardColumnRepository})
      : _boardColumnRepository = boardColumnRepository;

  final RxList<BoardColumnModel> boardColumns = <BoardColumnModel>[].obs;
  final RxBool isLoading = false.obs;

  // Método para editar a coluna
  void editColumn(BoardColumnModel updatedColumn) {
    try {
      final index = boardColumns.indexWhere(
        (col) => col.id == updatedColumn.id,
      );

      if (index != -1) {
        boardColumns[index] = updatedColumn;
        _boardColumnRepository.editBoardColumn(
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

      _boardColumnRepository.deleteBoardColumn(
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

      _boardColumnRepository.addBoardColumn(
        boardId: "default-board-id",
        boardColumnTitle: newColumn.title,
      );

      final updatedColumns =
          _boardColumnRepository.fetchBoardColumns(boardId: "default-board-id");

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

      final columns =
          _boardColumnRepository.fetchBoardColumns(boardId: "default-board-id");

      if (columns.isEmpty) {
        // Se não houver colunas, adiciona uma coluna padrão
        final defaultColumn = BoardColumnModel(
          id: "default-column-id",
          title: "Backlog",
          tasks: [],
        );

        columns.add(defaultColumn);

        _boardColumnRepository.addBoardColumn(
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
    _boardColumnRepository.updateBoardColumnOrder(
      boardId: "default-board-id",
      columns: boardColumns,
    );
  }
}
