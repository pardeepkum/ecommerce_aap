import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controller/cart_controller.dart';
import '../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Products product = Get.arguments as Products;
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title ?? '')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(product.image ?? ''),
              SizedBox(height: 16),
              Text(product.title ?? '', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('\$${product.price?.toStringAsFixed(2) ?? ''}', style: TextStyle(fontSize: 20)),
              SizedBox(height: 16),
              Text(product.description ?? ''),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('Add to Cart'),
                onPressed: () {
                  cartController.addToCart(product);
                  Get.snackbar('Added to Cart', '${product.title} has been added to the cart');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
