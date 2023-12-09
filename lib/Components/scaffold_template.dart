import 'package:flutter/material.dart';

class CupCareScaffoldTemplate extends StatelessWidget {
  const CupCareScaffoldTemplate({
    super.key,
    required this.backgroundColor,
    this.headlineColor = Colors.black,
    required this.currentView,
    required this.bottomAppBar,
    required this.showSearchBar,
  });

  final Widget currentView;
  final BottomAppBar bottomAppBar;
  final bool showSearchBar;
  final Color backgroundColor;
  final Color headlineColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout,
                color: headlineColor,
              ))
        ],
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 72),
              child: Text(
                "Bienvenue Jane",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: headlineColor),
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: currentView,
                ),
              ),
              //PUT THE SEARCH BAR HERE
              showSearchBar ? Placeholder() : Container()
            ]),
          )
        ]),
      ),
      bottomNavigationBar: bottomAppBar,
    );
  }
}
