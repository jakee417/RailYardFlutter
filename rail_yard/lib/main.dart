import 'package:flutter/material.dart';
import 'package:rail_yard/device_model/device_model_managers.dart';
import 'package:rail_yard/rail_yard_app.dart';
import 'package:provider/provider.dart';

void main() {
  var deviceManagers = DeviceManagers();
  runApp(ChangeNotifierProvider(
    create: (context) => deviceManagers,
    child: const RailYardApp(),
  ));
}
