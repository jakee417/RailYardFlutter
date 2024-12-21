import 'package:flutter/material.dart';

class ServerSettingsStatusView extends StatelessWidget {
  const ServerSettingsStatusView({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          'Status',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        subtitle: const Text('Communicate with a Rail Yard through a router'),
        onTap: () {
          // Do the status update
        },
        trailing: const Icon(Icons.check_box, color: Colors.green),
      ),
    );
  }
}
