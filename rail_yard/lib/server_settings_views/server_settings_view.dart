import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rail_yard/device_model/device_model_managers.dart';

class ServerSettingsView extends StatefulWidget {
  const ServerSettingsView({
    super.key,
    required this.index,
    required this.initialName,
  });
  final int index;
  final String initialName;

  @override
  State<ServerSettingsView> createState() => _ServerSettingsView();
}

class _ServerSettingsView extends State<ServerSettingsView> {
  late TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.initialName;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 150.0,
          child: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
            ),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            onChanged: (value) {
              context.read<DeviceManagers>().setManager(
                widget.index,
                (manager) {
                  manager.serverSettings.name = value;
                  return manager;
                },
              );
            },
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<DeviceManagers>().deleteManager(widget.index);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              elevation: 5,
              backgroundColor: Colors.red,
            ),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: const Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
