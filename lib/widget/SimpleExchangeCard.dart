import 'package:flutter/material.dart';

class SimpleExchangeCard extends StatelessWidget{
  String flagImagePath; // 货币国旗的URL
  final String currencyName; // 货币名称
  final String currencyCode; // 货币代码
  bool isSelected = false;// 是否被选中;

   SimpleExchangeCard({
    required this.currencyName,
    required this.currencyCode,  
}) : flagImagePath = "assets/flags/" + "cny" + ".png" {
    // 构造函数体，可以进行其他非 final 属性的赋值或初始化操作
    // 示例：根据某些条件设置 isSelected
    
  }

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    Row(
              children: [
                Image.asset(
                  flagImagePath,
                  width: 40.0,
                  height: 40.0,
                ),
                SizedBox(width: 10.0),
                Text(currencyName),
                SizedBox(width: 10.0),
                Text(currencyCode)
              ]
            );
    throw UnimplementedError();
  }

}