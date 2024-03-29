import 'package:cupcare/Components/product_card.dart';
import 'package:cupcare/Components/scaffold_template.dart';
import 'package:cupcare/Model/machine_model.dart';
import 'package:cupcare/Model/product_model.dart';
import 'package:cupcare/Services/authenticator.dart';
import 'package:cupcare/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MachineScreen extends StatefulWidget {
  const MachineScreen({super.key, required this.machine});

  final MachineModel machine;

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
                    widget.machine.position,
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

  Widget buildProductGridView() {
    return Consumer<Iterable<ProductModel>>(
      builder: (context, value, child) {
        var products = value.where(
            (element) => element.isAvailableOnMachine(widget.machine.docRef));
        return products.isNotEmpty
            ? GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 25,
                children: [
                  for (var product in products)
                    ProductCard(
                      activateNavigation: false,
                      product: product,
                    )
                ],
              )
            : Container();
      },
    );
  }

  Widget buildMachinesListView() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Text("Test");
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
