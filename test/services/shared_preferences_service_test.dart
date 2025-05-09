import "package:flutter_test/flutter_test.dart";
import "package:flutter_teste_omni/services/shared_preferences_service.dart";
import "package:shared_preferences/shared_preferences.dart";

const String stringKey = "testKey";
const String stringValue = "testValue";

const String listStringKey = "testKey";
const List<String> listStringValue = ["item1", "item2", "item3"];

void main() {
  group("SharedPreferencesService", () {
    late SharedPreferences sharedPreferences;
    late SharedPreferencesService sharedPreferencesService;

    // Função auxiliar para configurar o mock com valores iniciais
    Future<void> setupMockWithValues(Map<String, Object> initialValues) async {
      SharedPreferences.setMockInitialValues(initialValues);
      sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferencesService = SharedPreferencesService(
        sharedPreferences: sharedPreferences,
      );
    }

    /// Testes para o método getString
    group("getString", () {
      test(
        "deve retornar null quando nenhum valor estiver armazenado",
        () async {
          // Arrange
          await setupMockWithValues({});

          // Act
          final value = sharedPreferencesService.getString(stringKey);

          // Assert
          expect(value, isNull, reason: "Chave foi encontrada");
        },
      );

      test("deve retornar o valor correto quando estiver armazenado", () async {
        // Arrange
        await setupMockWithValues({stringKey: stringValue});

        // Act
        final actualValue = sharedPreferencesService.getString(stringKey);

        // Assert
        expect(
          actualValue,
          stringValue,
          reason: "Valor armazenado não é o mesmo que o esperado",
        );
      });
    });

    /// Testes para o método setString
    group("setString", () {
      test(
        "deve armazenar um valor que pode ser recuperado posteriormente",
        () async {
          // Arrange
          await setupMockWithValues({stringKey: stringValue});

          // Act
          await sharedPreferencesService.setString(stringKey, stringValue);

          final retrievedValue = sharedPreferencesService.getString(stringKey);

          // Assert
          expect(
            retrievedValue,
            stringValue,
            reason: "Valor armazenado não é o mesmo que o esperado",
          );
        },
      );
    });

    /// Testes para o método getStringList
    group("getStringList", () {
      test(
        "deve retornar null quando nenhuma lista estiver armazenada",
        () async {
          // Arrange
          await setupMockWithValues({});

          // Act
          final value = sharedPreferencesService.getStringList(listStringKey);

          // Assert
          expect(value, isNull, reason: "Chave foi encontrada");
        },
      );

      test("deve retornar a lista correta quando estiver armazenada", () async {
        // Arrange
        await setupMockWithValues({listStringKey: listStringValue});

        // Act
        final actualList = sharedPreferencesService.getStringList(
          listStringKey,
        );

        // Assert
        expect(
          actualList,
          listStringValue,
          reason: "Lista armazenada não é a mesma que a esperada",
        );
      });
    });

    /// Testes para o método setStringList
    group("setStringList", () {
      test(
        "deve armazenar uma lista que pode ser recuperada posteriormente",
        () async {
          // Arrange
          setupMockWithValues({listStringKey: listStringValue});

          // Act
          await sharedPreferencesService.setStringList(
            listStringKey,
            listStringValue,
          );

          final retrievedValue = sharedPreferencesService.getStringList(
            listStringKey,
          );

          // Assert
          expect(
            retrievedValue,
            listStringValue,
            reason: "Lista armazenada não é a mesma que a esperada",
          );
        },
      );
    });

    /// Testes para o método remove
    group("remove", () {
      test("deve remover uma chave previamente armazenada", () async {
        // Arrange
        await setupMockWithValues({stringKey: stringValue});

        // Act
        await sharedPreferencesService.remove(stringKey);

        // Assert
        expect(sharedPreferencesService.getString(stringKey), isNull);
      });
    });
  });
}
