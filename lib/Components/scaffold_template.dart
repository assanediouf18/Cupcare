import 'package:flutter/material.dart';

class CupCareScaffoldTemplate extends StatelessWidget {
  const CupCareScaffoldTemplate({
    super.key,
    required this.backgroundColor,
    required this.bannerMainElement,
    required this.child,
    required this.bottomAppBar,
    this.showSearchBar = false,
    this.appBarActions = const [],
  });

  final Widget child;
  final BottomAppBar? bottomAppBar;
  final bool showSearchBar;
  final Color backgroundColor;
  final List<Widget> appBarActions;
  final Widget bannerMainElement;

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
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: child,
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
