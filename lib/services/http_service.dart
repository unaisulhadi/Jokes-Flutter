import 'package:jokes_app/models/joke_model.dart';

abstract class HttpService {
  Future<JokeModel?> getJoke();
}
