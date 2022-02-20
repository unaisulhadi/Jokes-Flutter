// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:jokes_app/models/joke_model.dart';
import 'package:jokes_app/services/http_service.dart';
import 'package:http/http.dart' as http;

const BASE_URL = "https://v2.jokeapi.dev";

class HttpServiceImpl extends HttpService {

  @override
  Future<JokeModel?> getJoke(String categories, String blackListed) async{
    try {
      var result = await http.get(Uri.parse(BASE_URL + "/joke/$categories?blacklistFlags=$blackListed"));
      if (result.statusCode == 200) {
        var response = jokeModelFromJson(result.body);
        return response;
      } else {
        print(result.reasonPhrase);
        return null;
      }
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

}
