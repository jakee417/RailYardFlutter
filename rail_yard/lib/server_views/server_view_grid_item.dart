import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rail_yard/device_model/device_model_managers.dart';
import 'package:rail_yard/rail_yard_views/rail_yard_outline_view.dart';
import 'package:rail_yard/server_settings_views/server_settings_view.dart';

class ServerViewGridItem extends StatelessWidget {
  const ServerViewGridItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final deviceManagers = Provider.of<DeviceManagers>(context);
    var deviceManager = deviceManagers.managers.elementAt(index);
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => RailYardOutlineView(
                startingIndex: index,
                totalDevices: deviceManagers.managers.length,
              ),
            ),
          );
        },
        child: Container(
          width: 200,
          height: 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    // Use ElevatedButton here is a hack to keep spacing the same.
                    ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        elevation: 5,
                        backgroundColor: Colors.black,
                      ),
                      child: Icon(
                        Icons.wifi,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          showDragHandle: true,
                          builder: (BuildContext context) {
                            return ServerSettingsView(
                              index: index,
                              initialName: context
                                      .read<DeviceManagers>()
                                      .getManager(index)
                                      ?.serverSettings
                                      .name ??
                                  '',
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        elevation: 5,
                        backgroundColor: Colors.black,
                      ),
                      child: Icon(
                        Icons.settings,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Text(
                        deviceManager.serverSettings.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Icon(Icons.handyman, size: 15.0),
                      Text(
                        " 0 items",
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
