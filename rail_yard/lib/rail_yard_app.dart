import 'package:flutter/material.dart';
import 'package:rail_yard/server_views/server_view.dart';

class RailYardApp extends StatelessWidget {
  const RailYardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(title: const Text("Rail Yards")),
        body: const ServerView(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton:
            ElevatedButton(onPressed: () {}, child: const Icon(Icons.add)),
      ),
    );
  }
}
