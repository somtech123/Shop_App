import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int? quantity;
  final double price;
  CartItem(
      {required this.id,
      required this.title,
      this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items => {..._items};

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * (value.quantity!);
    });
    return total;
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => CartItem(
                id: value.id,
                title: value.title,
                price: value.price,
                quantity: (value.quantity! + 1),
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeSingleItem(String producId) {
    if (!_items.containsKey(producId)) {
      return;
    }
    if (_items[producId]!.quantity! > 1) {
      _items.update(
          producId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              quantity: (value.quantity! - 1)));
    } else {
      _items.remove(producId);
    }
    notifyListeners();
  }
}
