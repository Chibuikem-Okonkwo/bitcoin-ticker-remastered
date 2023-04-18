import 'package:http/http.dart' as http;
import 'dart:convert';

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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'ADE8021F-CDF3-4BCD-BF1E-48E7206C95A2';

class CoinData{

  Future getCoinData(String selectedCurrency) async{

    String requestURL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(requestURL));

    if(response.statusCode == 200) {

      String data = response.body;
      var decodedData = jsonDecode(data);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    }
    else{
      print(response.statusCode);
    }
  }
}
