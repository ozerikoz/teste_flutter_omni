import 'package:shared_preferences/shared_preferences.dart';

/// Classe Service para gerenciar o SharedPreferences como um Singleton
class SharedPreferencesService {
  final SharedPreferences _preferences;

  const SharedPreferencesService({required SharedPreferences sharedPreferences})
    : _preferences = sharedPreferences;

  /// Método para armazenar um valor [String] no SharedPreferences
  Future<void> setString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  /// Método para recuperar um valor [String] do SharedPreferences
  String? getString(String key) {
    return _preferences.getString(key);
  }

  /// Método para armazenar uma lista de [String] no SharedPreferences
  Future<void> setStringList(String key, List<String> value) async {
    await _preferences.setStringList(key, value);
  }

  /// Método para recuperar uma lista de [String] do SharedPreferences
  List<String>? getStringList(String key) {
    return _preferences.getStringList(key);
  }

  /// Método para remover uma chave [String] do SharedPreferences
  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }
}
