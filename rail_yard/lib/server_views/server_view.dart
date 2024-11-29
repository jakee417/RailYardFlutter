import 'package:flutter/material.dart';
import 'package:rail_yard/server_views/server_view_grid.dart';

class ServerView extends StatelessWidget {
  const ServerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ServerViewGrid(),
    );
  }
}
