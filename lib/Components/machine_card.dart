import 'package:flutter/material.dart';

class MachineCard extends StatelessWidget {
  const MachineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Row(
        children: [Icon(Icons.coffee_maker)],
      ),
    );
  }
}
