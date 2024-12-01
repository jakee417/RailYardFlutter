import 'package:flutter/material.dart';

class RailYardView extends StatelessWidget {
  const RailYardView({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.shade300,
            Colors.grey.shade400,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: const Column(
        children: [],
      ),
    );
  }
}
