import 'package:get/get.dart';
import 'package:jokes_app/controllers/controller.dart';
import 'package:jokes_app/services/http_service_impl.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(HttpServiceImpl());
    Get.put(JokeController());
  }
}
