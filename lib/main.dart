import 'package:flutter/material.dart';
import 'package:flutter_teste_omni/views/board_view.dart';
import 'package:flutter_teste_omni/views/theme/theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
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
