import 'location.dart';
import 'networking.dart';

class WeatherModel {
  static const _apiKey = 'b2acc50dcb03e2e55c6326e72358a3ca';
  static const _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  static const _baseQuery = 'appid=$_apiKey&units=metric';

  Future getCityWeather(String cityName) async {
    var url = '$_baseUrl/?$_baseQuery&q=$cityName';

    print(url);

    var networkHelper = NetworkHelper(url);
    return await networkHelper.getData();
  }

  Future getLocationWeather() async {
    var location = Location();
    await location.getCurrentLocation();

    var url = '$_baseUrl/?$_baseQuery&lat=${location.latitude}&lon=${location.longitude}';

    print(url);

    var networkHelper = NetworkHelper(url);
    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
