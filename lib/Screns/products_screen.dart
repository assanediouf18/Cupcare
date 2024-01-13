import 'package:cupcare/Components/machine_tile.dart';
import 'package:cupcare/Components/scaffold_template.dart';
import 'package:cupcare/color_schemes.g.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool showProductPage = true;

  @override
  Widget build(BuildContext context) {
    var bottomAppBarIconSize = 32.0;
    var machinesListView = buildMachinesListView();
    var bottomAppBar = getBottomAppBar(bottomAppBarIconSize);

    return CupCareScaffoldTemplate(
      angle: 64,
      backgroundColor: showProductPage ? baseFourthColor : baseSecondColor,
      appBarActions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ))
      ],
      bannerMainElement: Image.asset('assets/images/Protein_bar.png'),
      bottomAppBar: bottomAppBar,
      searchField: Container(),
      //child: Text('Hello'),
      child: MachinesGrid(machinesListView: machinesListView),
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

  Widget buildMachinesListView() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return MachineTile(
              isWorking: index % 3 != 2,
              cardAccepted: (index + 1) % 2 != 0,
              coinAccepted: index % 6 != 0);
        });
  }
}

class MachinesGrid extends StatelessWidget {
  const MachinesGrid({
    super.key,
    required this.machinesListView,
  });

  final Widget machinesListView;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 110,
          width: 400,
          height: 400,
          right: 0,
          child: FractionallySizedBox(
            child: machinesListView,
          ),
        ),
        //Positionnement du titre
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 50,
                child: Text(
                  'ProductName',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NunitoSans',
                    fontSize: 24,
                  ),
                ),
              ),
            )),
        //Positionnement de la description
        Positioned(
            top: 50,
            left: 20,
            right: 0,
            child: Center(
              child: Container(
                height: 50,
                child: Text(
                  'Appuie sur une machine pour mettre à jour la disponibilité du produit',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'NunitoSans',
                    fontSize: 15,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
