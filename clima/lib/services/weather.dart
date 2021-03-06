import 'location.dart';
import 'networking.dart';

class WeatherModel {
  static const _apiKey = '--REPLACE--';
  static const _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  static const _baseQuery = 'appid=$_apiKey&units=metric';

  Future getCityWeather(String cityName) {
    var url = '$_baseUrl/?$_baseQuery&q=$cityName';

    print(url);

    return _getWeatherData(url);
  }

  Future getLocationWeather() async {
    var location = Location();
    await location.getCurrentLocation();

    var url =
        '$_baseUrl/?$_baseQuery&lat=${location.latitude}&lon=${location.longitude}';

    print(url);

    return _getWeatherData(url);
  }

  Future _getWeatherData(String url) async {
    var networkHelper = NetworkHelper(url);
    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
