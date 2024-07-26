import 'package:exchangerat/controller/Controller.dart';
import 'package:exchangerat/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home: Home()));


class Home extends StatelessWidget {
  
  @override
  Widget build(context) {
    Get.put(Controller());
    // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    

    return Scaffold(
      // 使用Obx(()=>每当改变计数时，就更新Text()。
      appBar: AppBar(title:Text("极速汇率")),

      body: GetBuilder<Controller>(
        init: Controller(),
        builder: (controller) {
          return ListView(
              children: [
                controller.cards[0],
                controller.cards[1],
                controller.cards[2],
                controller.cards[3],
                controller.cards[4],
                controller.cards[5],
              ],
          );
        }
      ),
      bottomNavigationBar: ElevatedButton(onPressed: (){Get.to(()=>LoginPage());}, child: Text("跳转login页面")),
      );
  }
}

