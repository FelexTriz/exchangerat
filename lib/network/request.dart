import 'package:exchangerat/objects/ExchangeRate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 // 导入模型类


class NetworkService {
  static String API_KEY = "6ccafe94a72918f466b44cf5";
  static String exchangeRateUrl = "https://v6.exchangerate-api.com/v6/$API_KEY/latest/USD";

  static Future<ExchangeRate> fetchExchangeRateData_ExchangeRateAPI(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      return ExchangeRate.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<String> getData(String url) async {

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      return (response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
void main(List<String> args) {
  // NetworkService.fetchExchangeRateData_ExchangeRateAPI(NetworkService.exchangeRateUrl);
  NetworkService.getData("http://localhost:8080/api/USD");
}

