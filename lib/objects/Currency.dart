class Currency {
  final String flag;
  final String currencyCode;
  final String currencyDescription;
  double value=0.0;

  Currency({
    required this.flag,
    required this.currencyCode,
    required this.currencyDescription,
    required this.value,
  });

  // 初始化货币栏
  static List<Currency> LoadCurrency() {
    
      return [
        Currency(
          flag: 'assets/flags/cny.png',
          currencyCode: 'CNY',
          currencyDescription: '人民币 ￥',
          value: 100,
        ),
        Currency(
          flag: 'assets/flags/usd.png',
          currencyCode: 'USD',
          currencyDescription: '美元 \$',
          value: 13.76,
        ),
        Currency(
          flag: 'assets/flags/hkd.png',
          currencyCode: 'HKD',
          currencyDescription: '港元 HK\$',
          value: (107.51),
        ),
        Currency(
          flag: 'assets/flags/eur.png',
          currencyCode: 'EUR',
          currencyDescription: '欧元 €',
          value: (12.69),
        ),
        Currency(
          flag: 'assets/flags/jpy.png',
          currencyCode: 'JPY',
          currencyDescription: '日元 ¥',
          value: (1500),
        ),
        Currency(
          flag: 'assets/flags/gbp.png',
          currencyCode: 'GBP',
          currencyDescription: '英镑 £',
          value: (10.24),
        ),
      ];
    
  }

  // 初始化汇率表
  static Map<String, double> loadExchangeRates() {
    return {
      'CNY_USD': 0.1376,
      'CNY_HKD': 1.0751,
      'CNY_EUR': 0.1269,
      'CNY_NZD': 0.2239,
      'CNY_JPY': 22.1114,
      'USD_CNY': 7.2679,
      'HKD_CNY': 0.9302,
      'EUR_CNY': 7.8826,
      'NZD_CNY': 4.4679,
      'JPY_CNY': 0.0452,
      // 可以添加更多的汇率数据
    };
  }

  // static Future<ExchangeRate> getCurrencyExchangeRate() async {
  //   ExchangeRate exchangeRate = await NetworkService.fetchExchangeRateData_ExchangeRateAPI(NetworkService.exchangeRateUrl);
  //   return exchangeRate;
  // }
}