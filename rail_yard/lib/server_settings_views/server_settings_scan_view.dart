import 'package:flutter/material.dart';

class ServerSettingsScanView extends StatelessWidget {
  const ServerSettingsScanView({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Networks'),
        subtitle: const Text('Join a Rail Yard to a Wi-Fi network'),
        onTap: () {
          // Do the status update
        },
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
