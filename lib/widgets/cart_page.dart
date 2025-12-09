import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '../models/products_model.dart';
import '../provider/page_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final pageProvider = Provider.of<PageProvider>(context); // ✔ FIXED

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        backgroundColor: Colors.white,
      ),
      body: cart.cartItems.isEmpty
          ? Center(child: Text("Your cart is empty"))
          : ListView(
        children: cart.cartItems.entries.map((entry) {
          String name = entry.key;
          int qty = entry.value;

          final product = findProduct(name, pageProvider);

          if (product == null) return SizedBox();

          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(product.image),
            ),

            title: Text(product.name),

            subtitle: Text("₹ ${product.price} × $qty"),

            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    cart.decrease(product.name);
                  },
                ),

                Text(
                  qty.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: () {
                    cart.increase(product.name);
                  },
                ),

                SizedBox(width: 10),

                Text(
                  "₹ ${product.price * qty}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  /// FIX: pageProvider is now passed as parameter
  About? findProduct(String name, PageProvider p) {
    for (var comp in p.components) {
      if (comp is Products) {
        for (var item in comp.product) {
          if (item.name == name) return item;
        }
      }
    }
    return null;
  }
}
