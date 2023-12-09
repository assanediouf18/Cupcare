import 'package:cupcare/Components/product_card.dart';
import 'package:cupcare/color_schemes.g.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseMainColor,
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
        backgroundColor: baseMainColor,
      ),
      body: SafeArea(
        child: Column(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 72),
              child: Text(
                "Bienvenue Jane",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          Expanded(
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.0)),
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    for (var i = 0; i < 10; i++)
                      ProductCard(
                        isAvailable: (i % 5 != 3),
                      )
                  ],
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
