import 'package:flutter/material.dart';
import 'package:rail_yard/server_views/server_view_grid_item.dart';

class ServerViewGridItemWrapperView extends StatelessWidget {
  const ServerViewGridItemWrapperView({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return ServerViewGridItem(index: index);
  }
}
