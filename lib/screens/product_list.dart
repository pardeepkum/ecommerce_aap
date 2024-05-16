import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controller/product_controller.dart';
import '../widgets/product_tile.dart';

class ProductListScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final TextEditingController searchController = TextEditingController();

  ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed('/cart');
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(

                labelText: 'Search Products',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    productController.filterProducts('');
                  },
                ),
              ),
              onChanged: (value) {
                productController.filterProducts(value);
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (productController.errorMessage.isNotEmpty) {
                return Center(child: Text(productController.errorMessage.value));
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: ListView.builder(
                    itemCount: productController.filteredProducts.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        product: productController.filteredProducts[index],
                        onTap: () {
                          Get.toNamed('/product_detail', arguments: productController.filteredProducts[index]);
                        },
                      );
                    },
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
