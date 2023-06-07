import 'package:flutter/material.dart';

class CartItem {
  CartItem(
      {required this.productId,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.quantity});
  final String productId;
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  CartItem findById(String id) {
    return _items.values
        .toList()
        .firstWhere((element) => element.productId == id);
  }

  void addItem(
    String id,
    double price,
    String url,
    String title,
  ) {
    _items.putIfAbsent(
        id,
        () => CartItem(
              productId: id,
              title: title,
              price: price,
              quantity: 1,
              imageUrl: url,
            ));

    notifyListeners();
  }

  void updateQuantity(String id, String imageUrl, double price, int quantity,
      title, String updateType) {
    if (quantity < 1) {
      return;
    }
    if (updateType == 'increase') {
      // var newQuantity = quantity + 1;
      // var newPrice = price * quantity;
      _items.update(
        id,
        (value) => CartItem(
            productId: id,
            title: title,
            imageUrl: imageUrl,
            price: price * quantity,
            quantity: quantity + 1),
      );
    } else if (updateType == 'decrease') {
      _items.update(
        id,
        (value) => CartItem(
            productId: id,
            title: title,
            imageUrl: imageUrl,
            price: quantity * price,
            quantity: quantity - 1),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }
}
