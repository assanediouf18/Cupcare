import 'package:cupcare/Model/machine_model.dart';
import 'package:cupcare/Screns/machines_screen.dart';
import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

class MachineTile extends StatelessWidget {
  const MachineTile(
      {super.key,
      this.isWorking = true,
      this.cardAccepted = true,
      this.coinAccepted = true,
      this.activateNavigation = true,
      required this.machine,
      required this.name,
      this.price = 1});

  final bool isWorking;
  final bool cardAccepted;
  final bool coinAccepted;
  final String name;
  final int price;
  final MachineModel machine;
  final bool activateNavigation;

  @override
  Widget build(BuildContext context) {
    var size = 96.0;
    return Pressable.opacity(
      onPressed: activateNavigation
          ? () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MachineScreen(machine: machine),
              ))
          : () => {},
      child: Padding(
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
                    name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text("Prix: ${price / 100} euro")
                ],
              ),
              Expanded(child: Container()),
              /* isWorking
                  ? Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.tertiary,
                    )
                  : Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.error,
                    ), */
              //Icon(Icons.close),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  isWorking
                      ? Icon(
                          Icons.check,
                          color: Theme.of(context).colorScheme.tertiary,
                        )
                      : Icon(Icons.close,
                          color: Theme.of(context).colorScheme.error),
                  Row(
                    children: [
                      cardAccepted ? Icon(Icons.credit_card) : Container(),
                      coinAccepted ? Icon(Icons.monetization_on) : Container(),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
