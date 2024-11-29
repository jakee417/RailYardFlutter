import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rail_yard/device_model/device_model_managers.dart';

class ServerViewGrid extends StatefulWidget {
  const ServerViewGrid({super.key});

  @override
  State<ServerViewGrid> createState() => _ServerViewGrid();
}

class _ServerViewGrid extends State<ServerViewGrid> {
  @override
  Widget build(BuildContext context) {
    var deviceManagers = context.read<DeviceManagers>();
    return ListView(
      children: const [],
    );
  }
}
