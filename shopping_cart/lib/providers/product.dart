import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  Product(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.price,
      this.isFavorite = false});
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  bool isFavorite;

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Black Headphone',
      imageUrl: 'assets/images/black.png',
      price: 59.99,
    ),
    Product(
      id: 'p2',
      title: 'Red Headphone',
      imageUrl: 'assets/images/pink.png',
      price: 60.99,
    ),
    Product(
      id: 'p3',
      title: 'Blue Headphone',
      imageUrl: 'assets/images/blue.png',
      price: 70.99,
    ),
    Product(
      id: 'p4',
      title: 'White Headphone',
      imageUrl: 'assets/images/white.png',
      price: 100.99,
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  List<Product> get showFavoritesOnly {
    return items.where((element) => element.isFavorite).toList();
  }
}
