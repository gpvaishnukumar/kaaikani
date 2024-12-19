import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductController extends GetxController {
  final ApiService apiService = ApiService();
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    const query = """
      query {
        products {
          items {
            id
            name
            description
            featuredAsset {
              preview
            }
          }
        }
      }
    """;

    final result = await apiService.query(query);
    if (!result.hasException) {
      final data = result.data?['products']['items'] ?? [];
      products.value = List<Product>.from(data.map((item) => Product.fromMap(item)));
    }
  }
}
