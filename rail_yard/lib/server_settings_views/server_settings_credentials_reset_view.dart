import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rail_yard/device_model/device_model_managers.dart';

class ServerSettingsCredentialsResetView extends StatelessWidget {
  const ServerSettingsCredentialsResetView({
    super.key,
    required this.index,
  });
  final int index;

  Future<void> showAlert(BuildContext context, String name) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reset $name?'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Resetting will clear any saved SSID and password.'),
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
              },
              child: const Text(
                'Reset',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DeviceManagers>(
      builder: (context, value, child) => Card(
        child: ListTile(
          title: const Text(
            'Reset Credentials',
            style: TextStyle(color: Colors.red),
          ),
          subtitle: const Text('Reset a Rail Yard\'s Wi-Fi credentials'),
          onTap: () {
            showAlert(context,
                value.getManager(index)?.serverSettings.name ?? 'device');
          },
        ),
      ),
    );
  }
}
