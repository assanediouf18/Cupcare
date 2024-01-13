import 'package:cupcare/Components/product_card.dart';
import 'package:cupcare/Components/scaffold_template.dart';
import 'package:cupcare/color_schemes.g.dart';
import 'package:flutter/material.dart';

class MachineScreen extends StatefulWidget {
  const MachineScreen({super.key});

  @override
  State<MachineScreen> createState() => _MachineScreenState();
}

class _MachineScreenState extends State<MachineScreen> {
  bool showProductPage = true;

  @override
  Widget build(BuildContext context) {
    var bottomAppBarIconSize = 32.0;
    var productGridView = buildProductGridView();
    var bottomAppBar = getBottomAppBar(bottomAppBarIconSize);

    return CupCareScaffoldTemplate(
      angle: 64,
      backgroundColor: showProductPage ? baseThridColor : baseSecondColor,
      appBarActions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ))
      ],
      bannerMainElement: Icon(
        Icons.coffee_maker,
        size: 100,
      ),
      bottomAppBar: bottomAppBar,
      searchField: Container(),
      //child: Text('Hello'),
      child: ProductGrid(productGridView: productGridView),
    );
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

  GridView buildProductGridView() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 25,
      children: [
        for (var i = 0; i < 10; i++)
          ProductCard(
            isAvailable: (i % 5 != 3),
          )
      ],
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.productGridView,
  });

  final GridView productGridView;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 130,
            width: 400,
            height: 600,
            child: FractionallySizedBox(
              child: productGridView,
              widthFactor: 0.85,
              heightFactor: 0.90,
            )),
        //Positionnement du titre
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                child: Text(
                  'Machine Position',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NunitoSans',
                    fontSize: 24,
                  ),
                ),
              ),
            )),
        //Positionnement des moyens de paiements dispo
        Positioned(
            top: 50,
            left: 20,
            child: Center(
              child: Container(
                child: Row(
                  children: [
                    Text(
                      'Moyens de paiements disponibles :',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'NunitoSans',
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Icon(Icons.credit_card),
                    Icon(Icons.monetization_on),
                  ],
                ),
              ),
            )),
        Positioned(
            top: 100,
            left: 20,
            right: 0,
            child: Center(
              child: Container(
                child: Text(
                  'Appuie sur un produit pour mettre à jour sa disponibilité sur la machine',
                  style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )),
      ],
    );
  }
}
