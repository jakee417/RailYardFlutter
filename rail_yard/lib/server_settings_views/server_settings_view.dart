import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rail_yard/device_model/device_model_managers.dart';
import 'package:rail_yard/server_settings_views/server_settings_credentials_reset_view.dart';
import 'package:rail_yard/server_settings_views/server_settings_outline_view.dart';
import 'package:rail_yard/server_settings_views/server_settings_restart_view.dart';
import 'package:rail_yard/server_settings_views/server_settings_scan_view.dart';
import 'package:rail_yard/server_settings_views/server_settings_status_view.dart';
import 'package:rail_yard/server_settings_views/server_settings_update_view.dart';

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
          ServerSettingsDeleteButton(
            index: widget.index,
          )
        ],
      ),
      body: ListView(
        children: [
          ServerSettingsOutlineView(index: widget.index),
          ServerSettingsStatusView(index: widget.index),
          ServerSettingsScanView(index: widget.index),
          ServerSettingsUpdateView(index: widget.index),
          ServerSettingsCredentialsResetView(index: widget.index),
          ServerSettingsRestartView(index: widget.index),
        ],
      ),
    );
  }
}

class ServerSettingsDeleteButton extends StatelessWidget {
  const ServerSettingsDeleteButton({
    super.key,
    required this.index,
  });
  final int index;

  Future<void> showDeletionAlert({
    required BuildContext context,
    required String name,
    required int index,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove $name?'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Deleting will remove Rail yard from use.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<DeviceManagers>().deleteManager(index);
                Navigator.pop(context);
              },
              child: Text('Delete $name',
                  style: const TextStyle(
                    color: Colors.red,
                  )),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DeviceManagers>(
      builder: (context, value, child) => ElevatedButton(
        onPressed: () {
          showDeletionAlert(
            context: context,
            name: value.getManager(index)?.serverSettings.name ?? 'device',
            index: index,
          );
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
      ),
    );
  }
}
