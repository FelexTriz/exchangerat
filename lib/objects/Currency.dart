import 'package:exchangerat/widget/SimpleExchangeCard.dart';

class Currency {
  final String flag;
  final String currencyCode;
  final String currencyDescription;
  double value=0.0;
  static final Map<String,String> curencyNames  ={
    "AED":"阿联酋迪拉姆",
    "AFN": "阿富汗尼",
    "ALL": "阿尔巴尼亚列克",
    "AMD": "亚美尼亚德拉姆",
    "ANG": "荷属安的列斯盾",
    "AOA": "安哥拉宽扎",
    "ARS": "阿根廷比索",
    "AUD": "澳大利亚元",
    "AWG": "阿鲁巴弗罗林",
    "AZN": "阿塞拜疆马纳特",
    "BAM": "波黑可兑换马克",
    "BBD": "巴巴多斯元",
    "BDT": "孟加拉塔卡",
    "BGN": "保加利亚列弗",
    "BHD": "巴林第纳尔",
    "BIF": "布隆迪法郎",
    "BMD": "百慕大元",
    "BND": "文莱元",
    "BOB": "玻利维亚诺",
    "BRL": "巴西雷亚尔",
    "BSD": "巴哈马元",
    "BTC": "比特币",
    "BTN": "不丹努尔特鲁姆",
    "BWP": "博茨瓦纳普拉",
    "BYN": "白俄罗斯卢布",
    "BZD": "伯利兹元",
    "CAD": "加拿大元",
    "CDF": "刚果法郎",
    "CHF": "瑞士法郎",
    "CLF": "智利比索(UF)",
    "CLP": "智利比索",
    "CNH": "中国离岸人民币",
    "CNY": "人民币",
    "COP": "哥伦比亚比索",
    "CRC": "哥斯达黎加科朗",
    "CUC": "古巴可兑换比索",
    "CUP": "古巴比索",
    "CVE": "佛得角埃斯库多",
    "CZK": "捷克克朗",
    "DJF": "吉布提法郎",
    "DKK": "丹麦克朗",
    "DOP": "多米尼加比索",
    "DZD": "阿尔及利亚第纳尔",
    "EGP": "埃及镑",
    "ERN": "厄立特里亚纳克法",
    "ETB": "埃塞俄比亚比尔",
    "EUR": "欧元",
    "FJD": "斐济元",
    "FKP": "福克兰群岛镑",
    "GBP": "英镑",
    "GEL": "格鲁吉亚拉里",
    "GGP": "根西镑",
    "GHS": "加纳塞地",
    "GIP": "直布罗陀镑",
    "GMD": "冈比亚达拉西",
    "GNF": "几内亚法郎",
    "GTQ": "危地马拉格查尔",
    "GYD": "圭亚那元",
    "HKD": "港元",
    "HNL": "洪都拉斯伦皮拉",
    "HRK": "克罗地亚库纳",
    "HTG": "海地古德",
    "HUF": "匈牙利福林",
    "IDR": "印度尼西亚盾",
    "ILS": "以色列新谢克尔",
    "IMP": "马恩岛镑",
    "INR": "印度卢比",
    "IQD": "伊拉克第纳尔",
    "IRR": "伊朗里亚尔",
    "ISK": "冰岛克朗",
    "JEP": "泽西镑",
    "JMD": "牙买加元",
    "JOD": "约旦第纳尔",
    "JPY": "日元",
    "KES": "肯尼亚先令",
    "KGS": "吉尔吉斯斯坦索姆",
    "KHR": "柬埔寨瑞尔",
    "KMF": "科摩罗法郎",
    "KPW": "朝鲜元",
    "KRW": "韩元",
    "KWD": "科威特第纳尔",
    "KYD": "开曼元",
    "KZT": "哈萨克斯坦坚戈",
    "LAK": "老挝基普",
    "LBP": "黎巴嫩镑",
    "LKR": "斯里兰卡卢比",
    "LRD": "利比里亚元",
    "LSL": "莱索托洛蒂",
    "LYD": "利比亚第纳尔",
    "MAD": "摩洛哥迪拉姆",
    "MDL": "摩尔多瓦列伊",
    "MGA": "马达加斯加阿里亚里",
    "MKD": "北马其顿第纳尔",
    "MMK": "缅甸元",
    "MNT": "蒙古图格里克",
    "MOP": "澳门元",
    "MRU": "毛里塔尼亚乌吉亚",
    "MUR": "毛里求斯卢比",
    "MVR": "马尔代夫拉菲亚",
    "MWK": "马拉维克瓦查",
    "MXN": "墨西哥比索",
    "MYR": "马来西亚林吉特",
    "MZN": "莫桑比克梅蒂卡尔",
    "NAD": "纳米比亚元",
    "NGN": "尼日利亚奈拉",
    "NIO": "尼加拉瓜科多巴",
    "NOK": "挪威克朗",
    "NPR": "尼泊尔卢比",
    "NZD": "新西兰元",
    "OMR": "阿曼里亚尔",
    "PAB": "巴拿马巴波亚",
    "PEN": "秘鲁新索尔",
    "PGK": "巴布亚新几内亚基那",
    "PHP": "菲律宾比索",
    "PKR": "巴基斯坦卢比",
    "PLN": "波兰兹罗提",
    "PYG": "巴拉圭瓜拉尼",
    "QAR": "卡塔尔里亚尔",
    "RON": "罗马尼亚列伊",
    "RSD": "塞尔维亚第纳尔",
    "RUB": "俄罗斯卢布",
    "RWF": "卢旺达法郎",
    "SAR": "沙特里亚尔",
    "SBD": "所罗门群岛元",
    "SCR": "塞舌尔卢比",
    "SDG": "苏丹镑",
    "SEK": "瑞典克朗",
    "SGD": "新加坡元",
    "SHP": "圣赫勒拿镑",
    "SLL": "塞拉利昂利昂",
    "SOS": "索马里先令",
    "SRD": "苏里南元",
    "SSP": "南苏丹镑",
    "STD": "圣多美和普林西比多布拉(2018年前)",
    "STN": "圣多美和普林西比多布拉",
    "SVC": "萨尔瓦多科朗",
    "SYP": "叙利亚镑",
    "SZL": "斯威士兰里兰吉尼",
    "THB": "泰铢",
    "TJS": "塔吉克斯坦索莫尼",
    "TMT": "土库曼斯坦马纳特",
    "TND": "突尼斯第纳尔",
    "TOP": "汤加潘加",
    "TRY": "土耳其里拉",
    "TTD": "特立尼达和多巴哥元",
    "TWD": "新台币",
    "TZS": "坦桑尼亚先令",
    "UAH": "乌克兰格里夫纳",
    "UGX": "乌干达先令",
    "USD": "美元",
    "UYU": "乌拉圭比索",
    "UZS": "乌兹别克斯坦苏姆",
    "VEF": "委内瑞拉玻利瓦尔（旧）",
    "VES": "委内瑞拉玻利瓦尔",
    "VND": "越南盾",
    "VUV": "瓦努阿图瓦图",
    "WST": "萨摩亚塔拉",
    "XAF": "中非法郎",
    "XAG": "银盎司",
    "XAU": "金盎司",
    "XCD": "东加勒比元",
    "XDR": "特别提款权",
    "XOF": "西非法郎",
    "XPD": "钯盎司",
    "XPF": "太平洋法郎",
    "XPT": "铂盎司",
    "YER": "也门里亚尔",
    "ZAR": "南非兰特"};

  Currency({
    required this.flag,
    required this.currencyCode,
    required this.currencyDescription,
    required this.value,
  });

  // 初始化货币栏
  static List<SimpleExchangeCard> LoadCurrency() {
    List<SimpleExchangeCard> SimpleCards = [];
    curencyNames.forEach((key, value) {
      SimpleCards.add(SimpleExchangeCard(currencyName: value, currencyCode: key));
    });
    return SimpleCards;
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