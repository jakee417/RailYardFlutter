import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rail_yard/device_model/device_model_managers.dart';

class ServerSettingsRestartView extends StatelessWidget {
  const ServerSettingsRestartView({
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
          title: Text('Restart $name?'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This will turn the Rail yard off and on again.'),
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
                'Restart',
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
            'Restart Rail Yard',
            style: TextStyle(color: Colors.red),
          ),
          subtitle: const Text('Power a Rail Yard off, then back on'),
          onTap: () {
            showAlert(context,
                value.getManager(index)?.serverSettings.name ?? 'device');
          },
        ),
      ),
    );
  }
}
