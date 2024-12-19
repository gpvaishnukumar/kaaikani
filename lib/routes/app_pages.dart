import 'package:get/get.dart';
import '../views/home_view.dart';
import '../views/product_detail_view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.HOME;

  static final routes = [
    GetPage(name: AppRoutes.HOME, page: () => HomeView()),
    GetPage(name: AppRoutes.PRODUCT_DETAIL, page: () => ProductDetailView()),
  ];
}
