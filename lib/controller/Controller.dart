import 'dart:ffi';

import 'package:exchangerat/widget/ExchangeRateCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  var count = 0.obs;
  // Rx<ExchangeRateCard> card_0 = ExchangeRateCard(flagImagePath: "assets/flags/cny.png", currencyCode: "CNY", amount: 100, currencyName: "人民币").obs;
  // Rx<ExchangeRateCard> card_1 = ExchangeRateCard(flagImagePath: "assets/flags/usd.png", currencyCode: "USD", amount: 4.23, currencyName: "美元").obs;
  // Rx<ExchangeRateCard> card_2 = ExchangeRateCard(flagImagePath: "assets/flags/eur.png", currencyCode: "EUR", amount: 4.23, currencyName: "欧元").obs;
  // Rx<ExchangeRateCard> card_3 = ExchangeRateCard(flagImagePath: "assets/flags/hkd.png", currencyCode: "HKD", amount: 4.23, currencyName: "港币").obs;
  // Rx<ExchangeRateCard> card_4 = ExchangeRateCard(flagImagePath: "assets/flags/jpy.png", currencyCode: "JPY", amount: 4.23, currencyName: "日元").obs;
  // Rx<ExchangeRateCard> card_5 = ExchangeRateCard(flagImagePath: "assets/flags/gbp.png", currencyCode: "GBP", amount: 4.23, currencyName: "英镑").obs;
  RxList cards = [ExchangeRateCard(flagImagePath: "assets/flags/cny.png", currencyCode: "CNY", amount: 100, currencyName: "人民币"),
                            ExchangeRateCard(flagImagePath: "assets/flags/usd.png", currencyCode: "USD", amount: 4.23, currencyName: "美元"),
                            ExchangeRateCard(flagImagePath: "assets/flags/eur.png", currencyCode: "EUR", amount: 4.23, currencyName: "欧元"),
                            ExchangeRateCard(flagImagePath: "assets/flags/hkd.png", currencyCode: "HKD", amount: 4.23, currencyName: "港币"),
                            ExchangeRateCard(flagImagePath: "assets/flags/jpy.png", currencyCode: "JPY", amount: 4.23, currencyName: "日元"),
                            ExchangeRateCard(flagImagePath: "assets/flags/gbp.png", currencyCode: "GBP", amount: 4.23, currencyName: "英镑")].obs;
  
Map<String, double> conversionRates = {
  "CNY_CNY": 1.0,
  "CNY_USD": 0.13755,
  "CNY_EUR": 0.12877,
  "CNY_HKD": 1.075,
  "CNY_JPY": 15.49,
  "CNY_GBP": 0.1062,
  "USD_CNY": 1 / 0.13755,
  "USD_USD": 1.0,
  "USD_EUR": 0.93598,
  "USD_HKD": 7.81,
  "USD_JPY": 112.59,
  "USD_GBP": 0.77206,
  "EUR_CNY": 1 / 0.12877,
  "EUR_USD": 1 / 0.93598,
  "EUR_EUR": 1.0,
  "EUR_HKD": 8.344,
  "EUR_JPY": 120.3,
  "EUR_GBP": 0.82496,
  "HKD_CNY": 1 / 1.075,
  "HKD_USD": 1 / 7.81,
  "HKD_EUR": 1 / 8.344,
  "HKD_HKD": 1.0,
  "HKD_JPY": 14.4,
  "HKD_GBP": 0.0989,
  "JPY_CNY": 1 / 15.49,
  "JPY_USD": 1 / 112.59,
  "JPY_EUR": 1 / 120.3,
  "JPY_HKD": 1 / 14.4,
  "JPY_JPY": 1.0,
  "JPY_GBP": 0.0074,
  "GBP_CNY": 1 / 0.1062,
  "GBP_USD": 1 / 0.77206,
  "GBP_EUR": 1 / 0.82496,
  "GBP_HKD": 1 / 0.0989,
  "GBP_JPY": 1 / 0.0074,
  "GBP_GBP": 1.0,
};

  void onTap(String code){
    for (ExchangeRateCard card in cards) {
      
      if(card.currencyCode == code){
        card.containerColor =  Colors.grey[350];
        card.changeHeight(100);
        }
      else{
        card.changeHeight(95);
        card.containerColor = Colors.grey[200];
      }
    }
    update();
  }
  void onchange2(ExchangeRateCard card,String value){

  }
  void onchange(String code, String value, ){
      double selectedValue = 0.0;

      if(value !=""){
        selectedValue = double.parse(value);
       }
       
      //TODO 汇率计算
      for (ExchangeRateCard card in cards) {
        //当当前货币类型和目标货币类型不同时计算

        if(code != card.currencyCode)
        {String key = "$code"+"_${card.currencyCode}";

        double rate = conversionRates[key] ?? 0.0;
        card.amount = selectedValue * rate;
        if(card.currencyCode == code){
          card.amount = selectedValue;
        }
        
        card.editingController.text = card.amount.toStringAsFixed(4);}
      }

      update();
  }
}



