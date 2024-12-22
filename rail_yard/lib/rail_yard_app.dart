import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rail_yard/device_model/device_model_manager.dart';
import 'package:rail_yard/device_model/device_model_managers.dart';
import 'package:rail_yard/server_views/server_settings.dart';
import 'package:rail_yard/server_views/server_view.dart';

class RailYardApp extends StatelessWidget {
  RailYardApp({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController hostNameController = TextEditingController();

  void resetAlert() {
    nameController.text = '';
    hostNameController.text = '';
  }

  Future<void> _showDialog(BuildContext context) async {
    resetAlert();
    var deviceManagers = context.read<DeviceManagers>();
    nameController.text = 'Yard ${deviceManagers.managers.length + 1}';
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Add new device'),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<DeviceManagers>(
                  builder: (context, value, child) => TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Yard ${value.managers.length + 1}',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: const OutlineInputBorder(),
                      filled: true,
                    ),
                  ),
                ),
                const Divider(),
                TextFormField(
                  controller: hostNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a host name.';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Hostname',
                    hintText: 'RailYardXXXXXX',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    filled: true,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Dismiss'),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                var deviceManagers = context.read<DeviceManagers>();
                var newDeviceManager = DeviceManager();
                newDeviceManager.serverSettings = ServerSettings(
                  name: nameController.text,
                  hostname: hostNameController.text,
                );
                deviceManagers.addManager(newDeviceManager);
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rail Yards")),
      body: const ServerView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () => _showDialog(context),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(2),
          elevation: 5,
          backgroundColor: Colors.green,
          iconColor: Colors.white,
        ),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomAppBar(height: 35),
    );
  }
}
