import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartHolder extends StatelessWidget {
  const CartHolder(
      {required this.id,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.quantity,
      super.key});
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200,
          ),
          child: Image.asset(imageUrl),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.pink,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    cart.updateQuantity(
                        id, imageUrl, price, quantity, title, 'decrease');
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text('-'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text('$quantity'),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    cart.updateQuantity(
                        id, imageUrl, price, quantity, title, 'increase');
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text('+'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            cart.removeItem(id);
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Icon(
              Icons.delete,
              color: Colors.red,
            )),
          ),
        )
      ],
    );
  }
}
