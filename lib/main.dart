import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/cart_controller.dart';
import 'screens/cart_screen.dart';
import 'screens/product_details.dart';
import 'screens/product_list.dart';

void main() {
  Get.put(CartController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => ProductListScreen()),
        GetPage(name: '/product_detail', page: () => ProductDetailScreen()),
        GetPage(name: '/cart', page: () => CartScreen()),
      ],
    );
  }
}
