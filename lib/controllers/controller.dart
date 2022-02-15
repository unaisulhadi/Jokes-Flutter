import 'package:get/get.dart';
import 'package:jokes_app/models/joke_model.dart';
import 'package:jokes_app/services/http_service.dart';
import 'package:jokes_app/services/http_service_impl.dart';

class HomeController extends GetxController {
  late HttpService _httpService;

  HomeController() {
    _httpService = Get.find<HttpServiceImpl>();
  }

  var isLoading = true.obs;
  Rx<JokeModel?> joke = Rx(null);

  void getJoke() async {
    isLoading.value = true;
    final result = await _httpService.getJoke();
    isLoading.value = false;
    joke.value = result;
  }
}
