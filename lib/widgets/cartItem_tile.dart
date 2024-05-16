import 'package:flutter/material.dart';
import 'package:shopping/controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:shopping/models/product_model.dart';

class CartItemTile extends StatelessWidget {
  final Products product;

  CartItemTile({required this.product});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Card(
      child: ListTile(
        leading: Image.network(product.image ?? '', width: 50, height: 50, fit: BoxFit.cover),
        title: Text(product.title ?? ''),
        subtitle: Text('\$${product.price?.toStringAsFixed(2) ?? ''}'),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle),
          onPressed: () => cartController.removeFromCart(product),
        ),
      ),
    );
  }
}
