import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rail_yard/device_model/device_model_managers.dart';
import 'package:rail_yard/server_views/server_view_grid_wrapper_view.dart';

class ServerViewGrid extends StatefulWidget {
  const ServerViewGrid({super.key});

  @override
  State<ServerViewGrid> createState() => _ServerViewGrid();
}

class _ServerViewGrid extends State<ServerViewGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DeviceManagers>(
      builder: (context, value, child) => ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: value.managers.length,
        itemBuilder: (context, index) =>
            ServerViewGridItemWrapperView(index: index),
        separatorBuilder: (context, index) =>
            const Divider(color: Colors.transparent),
      ),
    );
  }
}
