import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jokes_app/models/joke_model.dart';
import 'package:jokes_app/screens/settings/settings_controller.dart';
import 'package:jokes_app/services/http_service.dart';
import 'package:jokes_app/services/http_service_impl.dart';

class HomeController extends GetxController {
  late HttpService _httpService;
  late GetStorage _getStorage;

  HomeController() {
    _httpService = Get.find<HttpServiceImpl>();
    _getStorage = GetStorage();

    getJokeCategories();
    getJokeBlackList();
  }

  var isLoading = true.obs;
  Rx<JokeModel?> joke = Rx(null);

  void getJoke() async {
    isLoading.value = true;

    final result = await _httpService.getJoke(getJokeCategoriesString(),getBlackListedString());
    isLoading.value = false;
    joke.value = result;
  }

  String getJokeCategoriesString() {
    var categories = <String>[];
    jokeCategories.forEach((key, value) {
      if (value == true) {
        categories.add(key);
      }
    });
    if (categories.isEmpty) {
      return "Any";
    }
    return categories
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(' ', '');
  }

  String getBlackListedString() {
    var blackListed = <String>[];
    blackList.forEach((key, value) {
      if (value == true) {
        blackListed.add(key);
      }
    });
    if (blackListed.isEmpty) {
      return "";
    }
    return blackListed
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(' ', '');
  }

  RxMap<String, dynamic> jokeCategories = RxMap();
  RxMap<String, dynamic> blackList = RxMap();

  final Map<String, dynamic> _defaultJokeCategories = {
    "Programming": true,
    "Miscellaneous": true,
    "Dark": true,
    "Pun": true,
    "Spooky": true,
    "Christmas": true
  };

  final Map<String, dynamic> _defaultBlackList = {
    "nsfw": false,
    "religious": false,
    "political": false,
    "racist": false,
    "sexist": false,
    "explicit": false
  };

  void getJokeCategories() {
    jokeCategories.value =
        _getStorage.read('jokeCategories') ?? _defaultJokeCategories;
  }

  void getJokeBlackList() {
    blackList.value = _getStorage.read('blackList') ?? _defaultBlackList;
  }
}
