import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  late GetStorage _getStorage;

  SettingsController() {
    _getStorage = GetStorage();

    getJokeCategories();
    getJokeBlackList();

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
    jokeCategories.value = _getStorage.read('jokeCategories') ?? _defaultJokeCategories;
  }

  void getJokeBlackList() {
    blackList.value = _getStorage.read('blackList') ?? _defaultBlackList;
  }

  void setJokeCategory(String key, bool value) {
    jokeCategories[key] = value;

  }

  void setBlackList(String key, bool value) {
    blackList[key] = value;
  }

  Future<void> saveJokeCategory() async {
    await _getStorage.write('jokeCategories', jokeCategories);
  }

  Future<void> saveBlackList() async {
    await _getStorage.write('blackList', blackList);
  }

}
