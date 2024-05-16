import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cart'),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(child: Text('Your cart is empty'));
        } else {
          return ListView.builder(
            itemCount: cartController.cartItems.length,
            itemBuilder: (context, index) {
              final item = cartController.cartItems[index];
              return ListTile(
                title: Text(item.title ?? ''),
                subtitle: Text('\$${item.price?.toStringAsFixed(2) ?? ''}'),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_shopping_cart),
                  onPressed: () {
                    cartController.removeFromCart(item);
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }
}
