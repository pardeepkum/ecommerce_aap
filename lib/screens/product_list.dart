import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controller/product_controller.dart';
import '../widgets/product_tile.dart';

class ProductListScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed('/cart');
            },
          )
        ],
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (productController.errorMessage.isNotEmpty) {
          return Center(child: Text(productController.errorMessage.value));
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child: ListView.builder(
              itemCount: productController.products.length,
              itemBuilder: (context, index) {
                return ProductTile(
                  product: productController.products[index],
                  onTap: () {
                    Get.toNamed('/product_detail', arguments: productController.products[index]);
                  },
                );
              },
            ),
          );
        }
      }),
    );
  }
}
