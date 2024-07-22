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
          title: Row(
            children: [
              Text(title,  textAlign: TextAlign.center,style: TextStyle(
                fontWeight:FontWeight.normal 
              ),),
              TextButton(onPressed: (){Get.back();}, child: Text("data")),
            ],
          ),
        ),
        
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }

}