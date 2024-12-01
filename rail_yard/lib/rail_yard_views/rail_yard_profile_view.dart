import 'package:flutter/material.dart';

class RailYardProfileView extends StatelessWidget {
  const RailYardProfileView({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profiles'),
        actions: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              elevation: 5,
            ),
            child: Icon(
              Icons.refresh,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
      body: const Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
