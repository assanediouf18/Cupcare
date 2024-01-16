import 'package:cupcare/Components/machine_tile.dart';
import 'package:cupcare/Components/scaffold_template.dart';
import 'package:cupcare/Model/machine_model.dart';
import 'package:cupcare/Model/product_model.dart';
import 'package:cupcare/Services/authenticator.dart';
import 'package:cupcare/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel product;
  const ProductScreen({super.key, required this.product});

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
            onPressed: () {
              Authenticator().signOut();
            },
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ))
      ],
      bannerMainElement: Image.asset(
        'assets/images/${widget.product.iconName}',
        scale: 3,
      ),
      bottomAppBar: bottomAppBar,
      searchField: Container(),
      child: MachinesGrid(
        machinesListView: machinesListView,
        product: widget.product,
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

  Widget buildMachinesListView() {
    List machines = widget.product.machines;
    return ListView.builder(
        itemCount: machines.length,
        itemBuilder: (BuildContext context, int index) {
          print(machines[index]);
          return Consumer<Iterable<MachineModel>>(
              builder: (context, value, child) {
            var currentMachine = value.firstWhere(
                (element) => element.docRef == machines[index]["machine"]);
            return MachineTile(
                activateNavigation: false,
                machine: currentMachine,
                name: currentMachine.position,
                price: machines[index]["price"],
                isWorking: machines[index]["availability"],
                cardAccepted: (index + 1) % 2 != 0,
                coinAccepted: index % 6 != 0);
          });
        });
  }
}

class MachinesGrid extends StatelessWidget {
  const MachinesGrid({
    super.key,
    required this.machinesListView,
    required this.product,
  });

  final Widget machinesListView;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 80,
            width: 400,
            height: 600,
            child: FractionallySizedBox(
              child: machinesListView,
              widthFactor: 0.85,
              heightFactor: 0.90,
            )),
        Positioned(
            top: 0,
            left: 90,
            child: Text(
              product.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'NunitoSans',
                fontSize: 24,
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
