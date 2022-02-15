import 'package:get/get.dart';
import 'package:jokes_app/controllers/controller.dart';
import 'package:jokes_app/services/http_service_impl.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HttpServiceImpl());
    Get.put(HomeController());
  }

}