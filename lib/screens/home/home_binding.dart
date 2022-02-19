import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jokes_app/services/http_service_impl.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HttpServiceImpl());
    Get.put(HomeController());
    Get.put(GetStorage());
  }

}