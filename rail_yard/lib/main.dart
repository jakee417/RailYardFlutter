import 'package:flutter/material.dart';
import 'package:rail_yard/device_model/device_model_managers.dart';
import 'package:rail_yard/rail_yard_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<DeviceManagers>(
      create: (context) => DeviceManagers(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            primary: Colors.blue,
            secondary: Colors.lightBlue,
            brightness: Brightness.light,
          ),
          buttonTheme: const ButtonThemeData(
            shape: CircleBorder(),
          ),
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: RailYardApp(),
      ),
    ),
  );
}
