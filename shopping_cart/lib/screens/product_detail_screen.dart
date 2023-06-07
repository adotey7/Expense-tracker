import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});
  static const routeName = '/product-detail-screen';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Widget buildContainerTile(Color color) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final product = Provider.of<Products>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 300,
              child: Image.asset(
                product.imageUrl,
                // fit: BoxFit.contain,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildContainerTile(Colors.yellow),
                const SizedBox(
                  width: 20,
                ),
                buildContainerTile(Colors.pink),
                const SizedBox(
                  width: 20,
                ),
                buildContainerTile(Colors.blue),
                const SizedBox(
                  width: 20,
                ),
                buildContainerTile(Colors.purpleAccent),
                const SizedBox(
                  width: 20,
                ),
                buildContainerTile(Colors.teal),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            product.toggleFavorite();
                          });
                        },
                        icon: product.isFavorite
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.pink,
                              )
                            : const Icon(
                                Icons.favorite_outline,
                                color: Colors.pink,
                              )),
                  ],
                ),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Text(textAlign: TextAlign.justify, '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ante purus, pharetra sed euismod ac, faucibus nec nunc. Aenean tristique suscipit ante. Morbi nec ipsum congue odio feugiat eleifend. Nunc faucibus sollicitudin dui, quis hendrerit mi iaculis a. Nam quis ipsum at urna pharetra euismod. Nulla porttitor facilisis eros a gravida. Fusce vitae dignissim nisi. Donec tempor nec mi sed mollis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.''')
          ],
        ),
      )),
    );
  }
}
