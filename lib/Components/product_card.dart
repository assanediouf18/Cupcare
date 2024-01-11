import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final bool isAvailable;
  final String name;
  final String iconName;

  const ProductCard(
      {super.key,
      this.isAvailable = true,
      required this.name,
      required this.iconName});

  @override
  Widget build(BuildContext context) {
    var size = 96.0;
    return Card(
      color: isAvailable
          ? Theme.of(context).cardTheme.surfaceTintColor
          : Theme.of(context).colorScheme.error,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage("assets/images/$iconName"),
              width: size,
              height: size,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: isAvailable
                  ? Theme.of(context).textTheme.bodyMedium
                  : TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
