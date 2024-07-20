import 'dart:ffi';

import 'package:exchangerat/network/request.dart';
import 'package:exchangerat/objects/ExchangeRate.dart';
import 'package:exchangerat/widget/ExchangeRateCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  var count = 0.obs;
  RxList cards = [ExchangeRateCard(flagImagePath: "assets/flags/cny.png", currencyCode: "CNY", amount: 0, currencyName: "人民币",),
                            ExchangeRateCard(flagImagePath: "assets/flags/usd.png", currencyCode: "USD", amount: 0, currencyName: "美元"),
                            ExchangeRateCard(flagImagePath: "assets/flags/eur.png", currencyCode: "EUR", amount: 0, currencyName: "欧元"),
                            ExchangeRateCard(flagImagePath: "assets/flags/hkd.png", currencyCode: "HKD", amount: 0, currencyName: "港币"),
                            ExchangeRateCard(flagImagePath: "assets/flags/jpy.png", currencyCode: "JPY", amount: 0, currencyName: "日元"),
                            ExchangeRateCard(flagImagePath: "assets/flags/gbp.png", currencyCode: "GBP", amount: 0, currencyName: "英镑")].obs;
  
@override
  Future<void> onInit() async {
    // TODO: implement onInit
    for (ExchangeRateCard card in cards) {
      card.conversionRates = ExchangeRate.parseJsonToMap(await NetworkService.getData("http://1.15.122.120:8828/api/${card.currencyCode}"));
    }
    super.onInit();
  }


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
  void onchange(ExchangeRateCard selectedCard,String value){
    print(value);
    double selectedValue = 0;
    if(value !=""){
       selectedValue = double.parse(value);
     }
     for (ExchangeRateCard card in cards) {
       if(card != selectedCard){
        String key = card.currencyCode;
        double rate = selectedCard.conversionRates[key] ?? 0.0;
        card.amount = selectedValue * rate;
        card.editingController.text = card.amount.toStringAsFixed(4);

       }
     }
     update();
  }

  
}



