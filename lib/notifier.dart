



import 'package:flutter/foundation.dart';
import 'package:flutter_app/model.dart';

class CartModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Results> _items = [];

  /// An unmodifiable view of the items in the cart.

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => _items.length * 42;

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(Results item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}