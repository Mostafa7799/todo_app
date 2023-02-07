import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/app_view_model.dart';
import 'views/task_page.dart';

void main() {
  runApp(
    /// Provider Manager
    ChangeNotifierProvider(
      /// My provider class
      create: (context) => AppViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      /// Home screen
      home: TaskPage(),
    );
  }
}
