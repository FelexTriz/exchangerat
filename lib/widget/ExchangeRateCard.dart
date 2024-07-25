import 'package:exchangerat/controller/Controller.dart';
import 'package:exchangerat/widget/ChangeRate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangeRateCard extends StatelessWidget {
  String flagImagePath;
  String currencyCode;
 String currencyName;
  double amount ;
  TextEditingController editingController = new TextEditingController();
  var containerColor = Colors.grey[200];
  //Card的高度
  double _height = 80;

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
        return Dismissible(
          //card滑动的key
          key: Key(currencyCode),
          confirmDismiss: _confirmDismiss,

          background: slideLeftBackground(),
          secondaryBackground: slideRightBackground(),
          child: AnimatedContainer(
            height: _height,
            duration: Duration(milliseconds: 200),
            padding: EdgeInsets.all(8.0),
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
                Text(currencyCode),
                Spacer(),
                Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                      Container(
                          width: 160.0, // 设置明确的宽度约束
                            child: TextField(
                              onTap: () {
                                controller.onTap(currencyCode);
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
                    ) ,
              ],
            ),
          ),
        );
      }
    );
  }
void changeHeight(double newHeight)=> _height = newHeight;

  Widget slideLeftBackground() {
    return Container(
      color: Colors.blue,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Transform.translate(
                offset: Offset(-20, 0),
                child: Text(
                  '切换货币',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal,fontSize: 18),
                ),
              ),
              SizedBox(width: 10),
              Transform.translate(
                offset: Offset(-20, 0),
                child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
              ),
            ],
          ),
        ),
      ),
    );
  }
   Widget slideRightBackground() {
    return Container(
      color: const Color.fromARGB(255, 33, 243, 180),
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               SizedBox(width: 10),
              Transform.translate(
                offset: Offset(0, 0),
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              Transform.translate(
                offset: Offset(0, 0),
                child: Text(
                  '切换货币',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 18),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }

    Future<bool?> _confirmDismiss(DismissDirection direction) async{
    
    await Future.delayed(Duration(microseconds: 20));
    Controller c = Get.find();

    c.selectedCard.value = this;
    c.selectedCard.update((val) { 
      val = this;
    });
    Get.to(()=>ChangeRate());
    return false;
}
}
