import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  Map<String, int> cartItems = {};   // key = productName, value = qty

  CartProvider() {
    loadCart();
  }

  Future<void> loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString("cart");

    if (data != null) {
      cartItems = Map<String, int>.from(jsonDecode(data));
    }

    notifyListeners();
  }

  Future<void> addToCart(String productName) async {
    cartItems[productName] = (cartItems[productName] ?? 0) + 1;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("cart", jsonEncode(cartItems));

    notifyListeners();
  }

  void increase(String productName) async {
    cartItems[productName] = (cartItems[productName] ?? 0) + 1;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("cart", jsonEncode(cartItems));

    notifyListeners();
  }

  void decrease(String productName) async {
    if (cartItems.containsKey(productName)) {
      cartItems[productName] = cartItems[productName]! - 1;

      // Remove if quantity becomes zero
      if (cartItems[productName]! <= 0) {
        cartItems.remove(productName);
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("cart", jsonEncode(cartItems));

      notifyListeners();
    }
  }


  int get totalItems {
    int sum = 0;
    cartItems.forEach((key, value) {
      sum += value;
    });
    return sum;
  }
}
