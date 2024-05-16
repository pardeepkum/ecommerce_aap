import 'package:flutter/material.dart';
import 'package:shopping/models/product_model.dart';

class ProductTile extends StatelessWidget {
  final Products product;
  final VoidCallback onTap;

  ProductTile({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(product.image ?? '', width: 50, height: 50, fit: BoxFit.cover),
        title: Text(product.title ?? ''),
        subtitle: Text('\$${product.price?.toStringAsFixed(2) ?? ''}'),
        onTap: onTap,
      ),
    );
  }
}
