import 'package:flutter/material.dart';
import 'package:weatherapp/helper/helper.dart';
import 'package:weatherapp/model/model.dart';

class HomeProvider with ChangeNotifier {
  WeatherModel? weatherModel;
  WeatherHelper helper = WeatherHelper();
  List<String> searchHistory = [];
  List<String> bookmarkHistory = [];
  Future<void> getData(String cityName) async {
    WeatherHelper weather = WeatherHelper();
    weatherModel = await weather.getWeather(cityName);
    notifyListeners();
  }

  String? getIcon(String main) {
    if (weatherModel != null) {
      if (weatherModel?.weather?[0].main == "Clouds") {
        return "assets/gif/cloudy.gif";
      } else if (weatherModel?.weather?[0].main == "Rain") {
        return "assets/gif/rain.gif";
      } else if (weatherModel?.weather?[0].main == "Clear") {
        return "assets/gif/cloudy.gif";
      } else if (weatherModel?.weather?[0].main == "Snow") {
        return "assets/gif/snow.gif";
      } else if (weatherModel?.weather?[0].main == "Mist") {
        return "assets/gif/mist.gif";
      } else if (weatherModel?.weather?[0].main == "Smoke") {
        return "assets/gif/smoke.gif";
      } else {
        return "assets/gif/200.gif";
      }
    }
    notifyListeners();
    return null;
  }

  String? getImage(String main) {
    if (weatherModel != null) {
      if (weatherModel?.weather?[0].main == "Clouds") {
        return "assets/image/8.png";
      } else if (weatherModel?.weather?[0].main == "Rain") {
        return "assets/image/12.png";
      } else if (weatherModel?.weather?[0].main == "Clear") {
        return "assets/image/8.png";
      } else if (weatherModel?.weather?[0].main == "Snow") {
        return "assets/image/7.png";
      } else if (weatherModel?.weather?[0].main == "Mist") {
        return "assets/image/11.png";
      } else if (weatherModel?.weather?[0].main == "Smoke") {
        return "assets/image/10.png";
      } else {
        return "assets/image/8.png";
      }
    }
    notifyListeners();
    return null;
  }

  String? getcardImage(String main) {
    if (weatherModel != null) {
      if (weatherModel?.weather?[0].main == "Clouds") {
        return "assets/image/sunny.png";
      } else if (weatherModel?.weather?[0].main == "Rain") {
        return "assets/image/Rain.png";
      } else if (weatherModel?.weather?[0].main == "Clear") {
        return "assets/image/sunny.png";
      } else if (weatherModel?.weather?[0].main == "Snow") {
        return "assets/image/Clear.png";
      } else if (weatherModel?.weather?[0].main == "Mist") {
        return "assets/image/Smoke.png";
      } else if (weatherModel?.weather?[0].main == "Smoke") {
        return "assets/image/Smoke.png";
      }
    }
    notifyListeners();
    return null;
  }

  Future<void> setSearch(String term) async {
    if (term.isNotEmpty && !searchHistory.contains(term)) {
      searchHistory.insert(0, term);
      await helper.saveSearchHistory(searchHistory);
      notifyListeners();
    }
  }

  Future<void> removeSearch(String term) async {
    searchHistory.remove(term);
    await helper.saveSearchHistory(searchHistory);
    notifyListeners();
  }

  Future<void> removeBookmark(String term) async {
    bookmarkHistory.remove(term);
    await helper.saveSearchHistory(bookmarkHistory);
    notifyListeners();
  }
}
