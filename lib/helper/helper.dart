import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/model/model.dart';

class WeatherHelper {
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
}
