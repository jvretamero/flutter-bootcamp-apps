import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  late Future<Map<String, double>> ratesFuture;

  Widget _materialDropdown({required Function(String?) onChanged}) {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: currenciesList
          .map(
            (currency) => DropdownMenuItem(child: Text(currency), value: currency),
          )
          .toList(),
      onChanged: onChanged,
    );
  }

  Widget _cupertinoPicker({required Function(String?) onChanged}) {
    return CupertinoPicker(
      itemExtent: 32,
      backgroundColor: Colors.lightBlue,
      onSelectedItemChanged: (int selectedIndex) {
        onChanged.call(currenciesList[selectedIndex]);
      },
      children: currenciesList
          .map(
            (currency) => Text(currency),
          )
          .toList(),
    );
  }

  Widget _picker() {
    if (Platform.isIOS) {
      return _cupertinoPicker(onChanged: _onCurrencySelected);
    } else {
      return _materialDropdown(onChanged: _onCurrencySelected);
    }
  }

  void _onCurrencySelected(String? value) {
    setState(() {
      if (value?.isNotEmpty ?? false) {
        selectedCurrency = value!;
      }

      _fetchRates();
    });
  }

  void _fetchRates() {
    ratesFuture = CoinData().getExchangeRates(selectedCurrency);
  }

  @override
  void initState() {
    super.initState();

    _fetchRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FutureBuilder<Map<String, double>>(
            future: ratesFuture,
            builder: (BuildContext context, AsyncSnapshot<Map<String, double>> snapshot) {
              bool isLoaded = snapshot.connectionState == ConnectionState.done;
              var rates = snapshot.data;
              var currentRate = isLoaded ? rates!['BTC']! : 0;

              return CoinCard(
                currency: 'BTC',
                rate: isLoaded ? currentRate.toStringAsFixed(2) : '?',
                selectedCurrency: selectedCurrency,
              );
            },
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: _picker(),
          ),
        ],
      ),
    );
  }
}

class CoinCard extends StatelessWidget {
  const CoinCard({
    Key? key,
    required this.currency,
    required this.rate,
    required this.selectedCurrency,
  }) : super(key: key);

  final String currency;
  final String rate;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $currency = $rate $selectedCurrency',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
