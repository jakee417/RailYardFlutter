import 'package:flutter/material.dart';

class ServerSettingsUpdateView extends StatelessWidget {
  const ServerSettingsUpdateView({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          'Update Firmware',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        subtitle: const Text('Update a Rail Yard\'s firmware'),
        onTap: () {
          // Do the status update
        },
      ),
    );
  }
}
