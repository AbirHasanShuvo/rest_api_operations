import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi_testing/for_eduTV/controller.dart';

class EdutvHomescreen extends StatelessWidget {
  const EdutvHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(EduTvController());
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(() =>
             Container(
              padding: const EdgeInsets.all(10),
              child: Row(children: List.generate(controller.latestData.length, (index){
                return Text(controller.latestData[index].title.toString());
              }),)
            ),
          ),
        ),
      ),
    );
  }
}
