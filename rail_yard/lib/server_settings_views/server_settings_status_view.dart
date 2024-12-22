import 'package:flutter/material.dart';

class ServerSettingsStatusView extends StatefulWidget {
  const ServerSettingsStatusView({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<ServerSettingsStatusView> createState() => _ServerSettingsStatusView();
}

class _ServerSettingsStatusView extends State<ServerSettingsStatusView> {
  bool loading = false;

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
          setState(
            () {
              loading = !loading;
            },
          );
        },
        trailing: !loading
            ? const Icon(Icons.check_box, color: Colors.green)
            : const CircularProgressIndicator(
                value: null,
                semanticsLabel: 'Fetching scan results',
              ),
      ),
    );
  }
}
