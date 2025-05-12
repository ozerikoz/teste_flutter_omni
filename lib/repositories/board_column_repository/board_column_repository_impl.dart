import "dart:convert";
import "package:flutter_teste_omni/models/board_column/board_column_model.dart";
import "package:flutter_teste_omni/repositories/board_column_repository/board_column_repository.dart";
import "package:flutter_teste_omni/services/shared_preferences_service.dart";
import "package:uuid/uuid.dart";

/// Implementação da interface [BoardColumnRepository]
///
/// Utiliza o [SharedPreferencesService] para armazenar e recuperar [BoardColumn]s
class BoardColumnRepositoryImpl extends BoardColumnRepository {
  final SharedPreferencesService _sharedPreferencesService;

  BoardColumnRepositoryImpl({
    required SharedPreferencesService sharedPreferencesService,
  }) : _sharedPreferencesService = sharedPreferencesService;

  String getColumnListKey(String boardId) => "columns_$boardId";

  @override
  Future<BoardColumnModel> addBoardColumn({
    required String boardId,
    required String boardColumnTitle,
  }) async {
    final key = getColumnListKey(boardId);

    final boardColumnId = Uuid().v4();

    final boardColumn = BoardColumnModel(
      id: boardColumnId,
      title: boardColumnTitle,
      tasks: [],
    );

    try {
      final current = _sharedPreferencesService.getStringList(key) ?? [];

      final updated = [...current, jsonEncode(boardColumn.toJson())];

      await _sharedPreferencesService.setStringList(key, updated);

      return boardColumn;
    } catch (e) {
      throw Exception(
        "Erro ao adicionar a coluna $boardColumnId ao board $boardId: $e",
      );
    }
  }

  @override
  Future<BoardColumnModel> editBoardColumn({
    required String boardId,
    required BoardColumnModel boardColumn,
  }) async {
    final key = getColumnListKey(boardId);
    try {
      final current = _sharedPreferencesService.getStringList(key) ?? [];

      final updated = current.map((columnStr) {
        final decoded = jsonDecode(columnStr);
        return decoded["id"] == boardColumn.id
            ? jsonEncode(boardColumn.toJson())
            : columnStr;
      }).toList();

      await _sharedPreferencesService.setStringList(key, updated);

      return boardColumn;
    } catch (e) {
      throw Exception(
        "Erro ao editar a coluna ${boardColumn.id} do board $boardId: $e",
      );
    }
  }

  @override
  Future<void> deleteBoardColumn({
    required String boardId,
    required String boardColumnId,
  }) async {
    final key = getColumnListKey(boardId);

    try {
      final current = _sharedPreferencesService.getStringList(key) ?? [];

      final updated = current.where((columnStr) {
        final decoded = jsonDecode(columnStr);
        return decoded["id"] != boardColumnId;
      }).toList();

      await _sharedPreferencesService.setStringList(key, updated);
    } catch (e) {
      throw Exception(
        "Erro ao deletar a coluna $boardColumnId do board $boardId: $e",
      );
    }
  }

  @override
  List<BoardColumnModel> fetchBoardColumns({required String boardId}) {
    final key = getColumnListKey(boardId);

    try {
      final columns = _sharedPreferencesService.getStringList(key) ?? [];

      return columns
          .map((columnStr) => BoardColumnModel.fromJson(jsonDecode(columnStr)))
          .toList();
    } catch (e) {
      throw Exception("Erro ao recuperar as colunas do quadro $boardId: $e");
    }
  }

  List<BoardColumnModel> updateBoardColumnOrder({
    required String boardId,
    required List<BoardColumnModel> columns,
  }) {
    final key = getColumnListKey(boardId);

    try {
      final updated = columns.map((column) {
        return jsonEncode(column.toJson());
      }).toList();

      _sharedPreferencesService.setStringList(key, updated);
    } catch (e) {
      throw Exception(
        "Erro ao atualizar a ordem das colunas do quadro $boardId: $e",
      );
    }

    return columns;
  }
}
