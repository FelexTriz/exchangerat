import 'dart:io';

import 'package:exchangerat/controller/Controller.dart';
import 'package:exchangerat/network/request.dart';
import 'package:exchangerat/objects/ExchangeRate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleExchangeCard extends StatelessWidget{
  String flagImagePath; // 货币国旗的URL
  final String currencyName; // 货币名称
  final String currencyCode; // 货币代码
  final String currencyConutry;//货币国家aac2
  bool isSelected = false;// 是否被选中;
   SimpleExchangeCard({
    required this.currencyName,
    required this.currencyCode,  
    required this.currencyConutry,
}) :  flagImagePath = File('assets/flags/' + currencyConutry + '.png').existsSync()
          ? 'assets/flags/' + currencyConutry + '.png'
          : 'assets/flags/cny.png' {
    // 构造函数体，可以进行其他非 final 属性的赋值或初始化操作
    // 示例：根据某些条件设置 isSelected
    
  }

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<Controller>(
      builder: (controller) {
        return RawMaterialButton(
          onPressed: () {
            controller.selectedCard.update((value) async {
              value?.currencyCode = currencyCode;
              value?.currencyName = currencyName;
              value?.flagImagePath =  "assets/flags/${currencyConutry}"+ ".png";
              value?.conversionRates = ExchangeRate.parseJsonToMap(await NetworkService.getData("http://1.15.122.120:8828/api/${currencyCode}"));
            });
            controller.update();
            Get.back();
          },
          child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          flagImagePath,
                          width: 40.0,
                          height: 40.0,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(currencyName),
                      SizedBox(width: 10.0),
                      Text(currencyCode)
                    ]
                  ),
        );
      }
    );
    throw UnimplementedError();
  }

}