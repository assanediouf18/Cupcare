import 'package:cupcare/Components/product_card.dart';
import 'package:cupcare/Components/scaffold_template.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showProductPage = true;

  @override
  Widget build(BuildContext context) {
    var bottomAppBarIconSize = 32.0;
    var productGridView = buildProductGridView();
    var bottomAppBar = getBottomAppBar(bottomAppBarIconSize);
    return CupCareScaffoldTemplate(
        productGridView: productGridView, bottomAppBar: bottomAppBar);
  }

  BottomAppBar getBottomAppBar(double bottomAppBarIconSize) {
    return BottomAppBar(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                showProductPage = true;
              });
            },
            icon: Icon(
              Icons.coffee,
              size: bottomAppBarIconSize,
            )),
        IconButton(
            onPressed: () {
              setState(() {
                showProductPage = false;
              });
            },
            icon: Icon(
              Icons.coffee_maker,
              size: bottomAppBarIconSize,
            ))
      ],
    ));
  }

  Padding buildProductGridView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
    );
  }
}
