import 'package:get/get.dart';
import 'package:shopping/models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <Products>[].obs;
  var totalPrice = 0.0.obs;

  void addToCart(Products product) {
    cartItems.add(product);
    updateTotalPrice();
  }

  void removeFromCart(Products product) {
    cartItems.remove(product);
    updateTotalPrice();
  }

  void updateTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price ?? 0.0;
    }
    totalPrice.value = total;
  }
}
