import 'package:cupcare/Components/machine_tile.dart';
import 'package:cupcare/Components/product_card.dart';
import 'package:cupcare/Components/scaffold_template.dart';
import 'package:cupcare/Model/machine_model.dart';
import 'package:cupcare/Model/product_model.dart';
import 'package:cupcare/Model/user_model.dart';
import 'package:cupcare/Services/authenticator.dart';
import 'package:cupcare/Services/database_service.dart';
import 'package:cupcare/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showProductPage = true;
  Iterable<ProductModel> products = [];
  var isLoading = false;
  var db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    var bottomAppBarIconSize = 32.0;
    var productGridView = buildProductGridView(context);
    var machinesListView = buildMachinesListView();
    var bottomAppBar = getBottomAppBar(bottomAppBarIconSize);
    var onBannerColor = showProductPage ? Colors.black : Colors.white;
    var searchField = _getsearchField("Rechercher dans CupCare");

    return CupCareScaffoldTemplate(
      backgroundColor: showProductPage ? baseMainColor : baseSecondColor,
      appBarActions: [
        IconButton(
            onPressed: () {
              Authenticator().signOut();
            },
            icon: Icon(
              Icons.logout,
              color: onBannerColor,
            ))
      ],
      bannerMainElement: Consumer<UserModel?>(
        builder: (context, value, child) => Text(
          "Bienvenue ${value!.firstName}",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: onBannerColor, fontWeight: FontWeight.w100, fontSize: 32),
        ),
      ),
      bottomAppBar: bottomAppBar,
      searchField: searchField,
      child: isLoading
          ? _buildSpinner()
          : (showProductPage ? productGridView : machinesListView),
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

  Widget buildProductGridView(BuildContext context) {
    return Consumer<Iterable<ProductModel>>(
      builder: (context, value, child) {
        return GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            for (var product in value)
              ProductCard(
                product: product,
              )
          ],
        );
      },
    );
  }

  Widget buildMachinesListView() {
    return Consumer<Iterable<MachineModel>>(
      builder: (context, value, child) {
        return ListView.builder(
            itemCount: value.length,
            itemBuilder: (BuildContext context, int index) {
              var machine = value.elementAt(index);
              return MachineTile(
                  name: machine.position,
                  isWorking: index % 3 != 2,
                  cardAccepted: (index + 1) % 2 != 0,
                  coinAccepted: index % 6 != 0);
            });
      },
    );
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

  Widget _buildSpinner() {
    return Center(
      child: Column(children: [
        SpinKitPouringHourGlass(color: baseSecondColor),
        Text("Chargement...")
      ]),
    );
  }
}
