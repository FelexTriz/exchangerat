import 'package:exchangerat/widget/SearchAppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChangeRate extends StatelessWidget{
  final String title = "切换货币";
  final String message = "messg";

  @override
  Widget build(BuildContext context) {
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

        ),
      ),
    );
  }

}