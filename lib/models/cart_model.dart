import 'package:flutter/material.dart';
import 'product_model.dart';

class CartItem {
  final Product product;
  final String size;
  final String color;
  int quantity;

  CartItem({
    required this.product,
    required this.size,
    required this.color,
    this.quantity = 1,
  });
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice {
    return _items.fold(
      0,
      (total, item) => total + (item.product.price * item.quantity),
    );
  }

  void addItem(Product product, String size, String color) {
    // Check if item already exists with same size/color
    final index = _items.indexWhere(
      (item) =>
          item.product.id == product.id &&
          item.size == size &&
          item.color == color,
    );

    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product, size: size, color: color));
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
