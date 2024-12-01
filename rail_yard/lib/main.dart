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
          primaryColor: Colors.blue,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            secondary: Colors.lightBlue,
          ),
        ),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: RailYardApp(),
      ),
    ),
  );
}
