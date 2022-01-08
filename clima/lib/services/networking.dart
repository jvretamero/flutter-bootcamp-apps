import 'package:dio/dio.dart';

class NetworkHelper {
  final String _url;

  NetworkHelper(this._url);

  Future getData() async {
    var dio = Dio();
    var response = await dio.get(_url);

    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
