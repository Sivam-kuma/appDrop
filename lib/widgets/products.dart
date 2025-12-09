import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/products_model.dart';
import '../provider/cart_provider.dart';

class Product extends StatelessWidget {
  final Products model;
  const Product({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:12.0),
          child: Text(
            model.value,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 15),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            itemCount: model.product.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,   // balanced layout
            ),
            itemBuilder: (context, index) {
              final e = model.product[index];

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ⭐ FIX: Use Expanded for image (no overflow)
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          e.image,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (c, o, s) => Center(
                            child: Icon(Icons.broken_image, size: 40),
                          ),
                          loadingBuilder: (c, child, loading) {
                            if (loading == null) return child;
                            return Center(
                              child: CircularProgressIndicator(color: Colors.black),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 8),

                    // Name
                    Text(
                      e.name,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    // Description
                    Text(
                      e.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),

                    SizedBox(height: 8),

                    Row(
                      children: [
                        Text(
                          "₹ ${e.price}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(
                          "${e.rate}",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    // Add to Cart button
                    GestureDetector(
                      onTap: () {
                        final cart = Provider.of<CartProvider>(context, listen: false);
                        cart.addToCart(e.name);

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("${e.name} added to cart"),
                          duration: Duration(seconds: 1),
                        ));
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
