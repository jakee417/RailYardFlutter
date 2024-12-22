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
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ServerSettingsScanViewChild()),
          );
        },
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class ServerSettingsScanViewChild extends StatefulWidget {
  const ServerSettingsScanViewChild({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ServerSettingsScanViewChild();
  }
}

class _ServerSettingsScanViewChild extends State<ServerSettingsScanViewChild> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    print("View appeared, checking  networks");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networks'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(
                'Scan',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              trailing: !loading
                  ? const SizedBox.shrink()
                  : const CircularProgressIndicator(
                      value: null,
                      semanticsLabel: 'Fetching scan results',
                    ),
              onTap: () {
                // Fetch scan results
                setState(
                  () {
                    loading = !loading;
                  },
                );
              },
            ),
          ),
          // Add the scan results here.
          const ListTile(
              subtitle: Text(
            "To enter Wi-Fi mode, select a network and submit credentials.\nThen, restart the Rail Yard to login.",
          )),
        ],
      ),
    );
  }
}
