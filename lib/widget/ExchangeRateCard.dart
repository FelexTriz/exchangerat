import 'package:exchangerat/controller/Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangeRateCard extends StatelessWidget {
  final String flagImagePath;
  final String currencyCode;
  final String currencyName;
  double amount ;
  TextEditingController editingController = new TextEditingController();
  var containerColor = Colors.grey[200];
  //Card的高度
  double _height = 95;

  Map<String, double> conversionRates = {
    "USD" : 1,
    "CNY" : 1,
    "EUR" : 1,
    "HKD" : 1,
    "JPY" : 1,
    "GBP":1
  };


  ExchangeRateCard({
    required this.flagImagePath,
    required this.currencyCode,
    required this.amount,
    required this.currencyName,

  });

  @override
  Widget build(BuildContext context) {
    editingController.text = amount.toStringAsFixed(4);
    return GetBuilder<Controller>(
      builder: (controller) {
        return AnimatedContainer(
          height: _height,
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: containerColor,
            // borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Image.asset(
                flagImagePath,
                width: 40.0,
                height: 40.0,
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currencyCode,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    Container(
                        width: 160.0, // 设置明确的宽度约束
                          child: TextField(
                            onTap: () {
                              controller.onTap(currencyCode);
                              // controller.onTap2(this);
                            },
                            keyboardType: TextInputType.number,
                            controller: editingController,
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true, // 使输入框更紧凑
                              hintText: editingController.text,
                            ),
                            onChanged:(String value){
                              controller.onchange(this,value);

                            } ,
                          ),
                        ),
                        Text(currencyName)
                    ],
                  )
                ,
            ],
          ),
        );
      }
    );
  }
void changeHeight(double newHeight)=> _height = newHeight;
}
