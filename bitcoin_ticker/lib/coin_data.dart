import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<double> getExchangeRate(String from, String to) async {
    var apiKey = dotenv.env['API_KEY'];

    var url = 'https://rest.coinapi.io/v1/exchangerate/$from/$to?apikey=$apiKey';
    var response = await Dio().get(url);

    if (response.statusCode == 200) {
      return response.data['rate'];
    } else {
      return 0.0;
    }
  }
}
