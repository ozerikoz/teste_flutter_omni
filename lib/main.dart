import 'package:flutter/material.dart';
import 'package:flutter_teste_omni/controllers/task_controller.dart';
import 'package:flutter_teste_omni/repositories/board_column_repository/board_column_repository_impl.dart';
import 'package:flutter_teste_omni/repositories/task_repository/task_repository_impl.dart';
import 'package:flutter_teste_omni/services/shared_preferences_service.dart';
import 'package:flutter_teste_omni/views/board_view.dart';
import 'package:flutter_teste_omni/views/theme/theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_teste_omni/controllers/board_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(const MainApp());
}

Future<void> initDependencies() async {
  // Registro do SharedPreferencesService
  final sharedPreferencesService =
      await Get.putAsync(() async => SharedPreferencesService(
            sharedPreferences: await SharedPreferences.getInstance(),
          ));

  // Registro dos Repositórios
  final boardColumnRepository = Get.put(BoardColumnRepositoryImpl(
    sharedPreferencesService: sharedPreferencesService,
  ));

  final taskRepository = Get.put(TaskRepositoryImpl(
    sharedPreferencesService: sharedPreferencesService,
  ));

  // Registro dos Controllers
  Get.put(BoardController(boardColumnRepository: boardColumnRepository));
  Get.put(TaskController(taskRepository: taskRepository));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste Flutter Omni',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => const BoardView())],
    );
  }
}
