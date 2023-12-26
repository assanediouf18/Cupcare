import 'package:flutter/material.dart';

class CupCareScaffoldTemplate extends StatelessWidget {
  const CupCareScaffoldTemplate({
    super.key,
    required this.backgroundColor,
    required this.bannerMainElement,
    required this.child,
    required this.bottomAppBar,
    required this.searchField,
    this.showSearchBar = true,
    this.appBarActions = const [],
  });

  final Widget child;
  final BottomAppBar? bottomAppBar;
  final bool showSearchBar;
  final Color backgroundColor;
  final List<Widget> appBarActions;
  final Widget bannerMainElement;
  final Container searchField;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: appBarActions,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 72),
              child: bannerMainElement,
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
                  child: child,
                ),
              ),
              //PUT THE SEARCH BAR HERE
              showSearchBar ? searchField : Container(),
            ]),
          )
        ]),
      ),
      bottomNavigationBar: bottomAppBar,
    );
  }

  Container _searchField(var hintText) {
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
