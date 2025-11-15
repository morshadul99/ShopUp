import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_up/utils/colors.dart';



class CustomDialogue extends StatelessWidget {

  CustomDialogue({

  required String? title,
    required String? message,



});

  @override
  Widget build(BuildContext context) {
    return Dialog(

      child: Container(


        height: Get.height*0.2,
        decoration: BoxDecoration(

          color: Appcolors.primary_color
        ),
        child: Column(

          children: [





          ],
        ),
      ),

    );




  }
}
