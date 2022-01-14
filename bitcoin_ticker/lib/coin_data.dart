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
  final String apiKey = dotenv.get('API_KEY', fallback: '');

  Future<Map<String, double>> getExchangeRates(String selectedCurrency) async {
    Map<String, double> rates = {};

    for (String crypto in cryptoList) {
      var rate = await _getExchangeRate(crypto, selectedCurrency);
      rates[crypto] = rate;
    }

    return rates;
  }

  Future<double> _getExchangeRate(String from, String to) async {
    var url = 'https://rest.coinapi.io/v1/exchangerate/$from/$to?apikey=$apiKey';
    var response = await Dio().get(url);

    if (response.statusCode == 200) {
      return response.data['rate'];
    } else {
      return 0;
    }
  }
}
