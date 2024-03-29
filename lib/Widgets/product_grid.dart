import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import './product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showonlyfavs;
  const ProductGrid(this.showonlyfavs, {super.key});
  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final loadedProducts =
        showonlyfavs ? productsdata.favoriteItems : productsdata.items;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: const ProductItem(),
      ),
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
    );
  }
}
