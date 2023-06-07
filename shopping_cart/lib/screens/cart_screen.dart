import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../components/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    final cartItems = cartData.items;
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Cart',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          cartItems.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      itemCount: cartData.items.length,
                      itemBuilder: (context, index) {
                        return CartHolder(
                            id: cartItems.keys.toList()[index],
                            title: cartItems.values.toList()[index].title,
                            price: cartItems.values.toList()[index].price,
                            imageUrl: cartItems.values.toList()[index].imageUrl,
                            quantity:
                                cartItems.values.toList()[index].quantity);
                      }))
              : Center(child: Text('No Item in cart!')),
        ],
      ),
    ));
  }
}
