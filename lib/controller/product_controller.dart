import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/api_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var products = <Products>[].obs;
  var filteredProducts = <Products>[].obs;
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
        filteredProducts.assignAll(products); // Initialize filteredProducts with all products
        Get.snackbar('Products Loaded', 'You received ${productsResult.length} products.');
      } else {
        errorMessage('No products found');
      }
    } catch (e) {
      errorMessage('Failed to load products: $e');
    } finally {
      isLoading(false);
    }
  }

  // Method to filter products based on search query
  void filterProducts(String query) {
    if (query.isEmpty) {
      // If query is empty, show all products
      filteredProducts.assignAll(products);
    } else {
      // Filter products based on the search query (by name in this example)
      filteredProducts.assignAll(products.where((product) => product.title!.toLowerCase().contains(query.toLowerCase())).toList());
    }
  }
}
