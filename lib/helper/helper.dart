import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/model/model.dart';

class WeatherHelper {
  List<String> searchHistory = [];
  Future<WeatherModel?> getWeather(String cityName) async {
    String APIString =
        'https://api.openweathermap.org/data/2.5/weather?&appid=7cf8dd4628dda6b62b82e9cae08229eb&units=metric&q=$cityName';

    http.Response response = await http.post(Uri.parse(APIString));
    if (response.statusCode == 200) {
      String weather = response.body;
      var APIData = jsonDecode(weather);
      WeatherModel weatherModel = WeatherModel.mapToModel(APIData);
      return weatherModel;
    }
    return null;
  }

  Future<void> saveSearchHistory(List<String> history) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("searchHistory", history);
  }

  void addSearchHistory(List<String> history) async {
    final shr = await SharedPreferences.getInstance();
    await shr.setStringList('searchHistory', history);
  }

  Future<List<String>> getSearchHistory() async {
    final shr = await SharedPreferences.getInstance();
    return shr.getStringList('searchHistory') ?? [];
  }

  void setSearch(List<String> search) async {
    final SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setStringList("searchHistory", searchHistory);
  }

  Future<List<String>?> getSearch() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getStringList("searchHistory") ?? [];
  }
}
