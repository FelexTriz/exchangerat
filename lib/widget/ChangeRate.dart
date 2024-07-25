import 'package:exchangerat/controller/Controller.dart';
import 'package:exchangerat/widget/SearchAppbar.dart';
import 'package:exchangerat/widget/SimpleExchangeCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:exchangerat/objects/Currency.dart';
class ChangeRate extends StatelessWidget{
  final String title = "切换货币";
  final String message = "messg";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      builder: (controller) {
        return MaterialApp(
          title: 'Flutter Demo',
          home: Scaffold(
            appBar: AppBar(
              title: Stack(
                children: [

                  Align(
                    alignment: Alignment.center,
                    child: Text(title,  textAlign: TextAlign.center,style: TextStyle(
                      fontWeight:FontWeight.normal 
                    ),
                  ),
                ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: (){Get.back();},
                       icon:Icon(Icons.arrow_forward_ios),
                       style: ButtonStyle(overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),),
                    )
                  ),
                ],
              ),
              bottom:PreferredSize(preferredSize: Size(20,15), child: SearchAppBar(hintLabel: "货币/金属/国家/地区", onSubmitted: (String string){}))
        
            ),
            
            body: Center(
                child: ListView.builder(
                    itemBuilder: (BuildContext context, int index){
                      return controller.SimpleCards[index];
                    },
                     itemCount: controller.SimpleCards.length,
                )
            ),
          ),
        );
      }
    );
  }

}