import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/api_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var products = <Products>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var productsResult = await ApiService.fetchProducts();
      if (productsResult.isNotEmpty) {
        products.assignAll(productsResult);
        Get.snackbar('Products Loaded', 'Here you go, you received ${productsResult.length} products. If you need more, just ask for it');
      } else {
        errorMessage('No products found');
      }
    } catch (e) {
      errorMessage('Failed to load products: $e');
    } finally {
      isLoading(false);
    }
  }
}
