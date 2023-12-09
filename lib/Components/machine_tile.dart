import 'package:flutter/material.dart';

class MachineTile extends StatelessWidget {
  const MachineTile({super.key, this.isWorking = true});

  final bool isWorking;

  @override
  Widget build(BuildContext context) {
    var size = 96.0;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.coffee_maker,
              size: size,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nom de la machine",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text("Prix: 0.01 euro")
              ],
            ),
            Expanded(child: Container()),
            isWorking
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.tertiary,
                  )
                : Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.error,
                  )
          ],
        ),
      ),
    );
  }
}
