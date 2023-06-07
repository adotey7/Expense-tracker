import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';

import '../providers/product.dart';
import '../providers/cart.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {
      // {required this.id,
      // required this.title,
      // required this.imageUrl,
      // required this.price,
      super.key});
  // final String id;
  // final String title;
  // final String imageUrl;
  // final double price;

  @override
  Widget build(BuildContext context) {
    final productItem = Provider.of<Product>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: productItem.id);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    productItem.imageUrl,
                    height: 250,
                    width: double.infinity,
                  ),
                  Positioned(
                    right: 10,
                    child: Consumer<Product>(
                      builder: (context, value, child) {
                        return IconButton(
                          icon: Icon(
                            productItem.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: Colors.pink,
                          ),
                          onPressed: () {
                            productItem.toggleFavorite();
                          },
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: [
                          Text(
                            productItem.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '\$${productItem.price}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.pink,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            final carts = Provider.of<Cart>(context, listen: false);
            carts.addItem(productItem.id, productItem.price,
                productItem.imageUrl, productItem.title);
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                'Add to Cart',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
