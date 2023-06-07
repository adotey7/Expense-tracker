import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../components/product_card.dart';

enum Toggles {
  favorites,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products =
        _isFavorited ? productData.showFavoritesOnly : productData.items;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              searchBar(context),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3 / 5,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: products[index],
                        child: ProductCard(),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row searchBar(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            filled: true,
            fillColor: Colors.grey.shade200,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      PopupMenuButton(
          onSelected: (value) {
            setState(() {
              if (value == Toggles.favorites) {
                _isFavorited = true;
              } else {
                _isFavorited = false;
              }
            });
            print('rebuilt');
          },
          itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('Show Favorites'),
                  value: Toggles.favorites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: Toggles.all,
                ),
              ]),
    ]);
  }
}
