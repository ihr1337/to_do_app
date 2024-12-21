import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/common/strings.dart';
import 'package:to_do_app/pages/home_page.dart';
import 'package:to_do_app/state/to_do_list_notifier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ToDoListNotifier()),
      ],
      child: const ToDoApp(),
    ),
  );
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
        ),
      ),
      home: const HomePage(),
    );
  }
}
