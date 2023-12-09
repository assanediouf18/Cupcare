import 'package:cupcare/color_schemes.g.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseMainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CupCare",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              "Votre Café, Votre Instant",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Placeholder(),
            ElevatedButton(onPressed: () {}, child: Text('Se connecter')),
            FilledButton(onPressed: () {}, child: Text("S'inscrire")),
          ],
        ),
      ),
    );
  }
}
