import 'package:flutter_teste_omni/models/board_column/board_column_model.dart';

/// Interface para BoardColumnRepository
abstract class BoardColumnRepository {
  /// Método para adicionar uma [BoardColumn]
  Future<BoardColumn> addBoardColumn({
    required String boardId,
    required String boardColumnTitle,
  });

  /// Método para editar uma [BoardColumn]
  Future<BoardColumn> editBoardColumn({
    required String boardId,
    required BoardColumn boardColumn,
  });

  /// Método para deletar uma [BoardColumn]
  Future<void> deleteBoardColumn({
    required String boardId,
    required String boardColumnId,
  });

  /// Método para buscar todas as [BoardColumn]s de um [Board]
  List<BoardColumn> fetchBoardColumns({required String boardId});
}
