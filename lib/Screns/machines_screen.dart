import 'package:cupcare/Components/machine_tile.dart';
import 'package:cupcare/Components/product_card.dart';
import 'package:cupcare/Components/scaffold_template.dart';
import 'package:cupcare/Model/product_model.dart';
import 'package:cupcare/Services/authenticator.dart';
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
    var machinesListView = buildMachinesListView();
    var bottomAppBar = getBottomAppBar(bottomAppBarIconSize);
    var onBannerColor = showProductPage ? Colors.black : Colors.white;
    var searchField = _getsearchField("Rechercher dans CupCare");

    return CupCareScaffoldTemplate(
      angle: 64,
      backgroundColor: showProductPage ? baseThridColor : baseSecondColor,
      appBarActions: [
        IconButton(
            onPressed: () {
              Authenticator().signOut();
            },
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
      child: Stack(
        children: [
          Positioned(
              top: 120,
              width: 400,
              height: 600,
              child: FractionallySizedBox(
                widthFactor: 0.85,
                heightFactor: 0.90,
                child: productGridView,
              )),
          Positioned(
              top: 0,
              left: 90,
              child: Text(
                'Machine Position',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NunitoSans',
                  fontSize: 24,
                ),
              )),
          Positioned(
              top: 50,
              left: 0,
              child: Text(
                'Moyens de paiements disponibles :',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'NunitoSans',
                  fontSize: 15,
                ),
              )),
          Positioned(
              top: 50,
              left: 300,
              child: Row(
                children: [
                  Icon(Icons.credit_card),
                  Icon(Icons.monetization_on)
                ],
              )),
          Positioned(
              top: 100,
              left: 0,
              child: Text(
                'Appuie sur un produit pour mettre à jour ',
                style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )),
          Positioned(
              top: 120,
              left: 0,
              child: Text(
                'sa disponibilité sur la machine',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'NunitoSans',
                  fontSize: 15,
                ),
              )),
        ],
      ),
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
              product: ProductModel(
                  iconName: "coffee_cup.png",
                  name: "Café de test",
                  machines: []))
      ],
    );
  }

  Widget buildMachinesListView() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return MachineTile(
            isWorking: index % 3 != 2,
            cardAccepted: (index + 1) % 2 != 0,
            coinAccepted: index % 6 != 0,
            name: 'Test',
          );
        });
  }

  Container _getsearchField(var hintText) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(217, 217, 217, 1.0),
            contentPadding: EdgeInsets.all(10),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/images/search.png'),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
