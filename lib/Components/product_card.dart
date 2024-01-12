import 'package:cupcare/Model/product_model.dart';
import 'package:cupcare/Screns/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:pressable/pressable.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var size = 96.0;
    return Pressable.opacity(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(product: product),
          )),
      child: Card(
        color: product.isAvailable()
            ? Theme.of(context).cardTheme.surfaceTintColor
            : Theme.of(context).colorScheme.error,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage("assets/images/${product.iconName}"),
                width: size,
                height: size,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: product.isAvailable()
                    ? Theme.of(context).textTheme.bodyMedium
                    : TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
