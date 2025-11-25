import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_up/features/home/controller/home_controller.dart';
import 'package:shop_up/utils/fonts_style.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimentions.dart';

class ColorsItemScreen extends StatelessWidget {
   ColorsItemScreen({super.key});

  HomeController  homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {


    return GetBuilder(builder: (controller){

      var data = homeController.productDetailsModel;
      return ListView.builder(

          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: data.colors.length,
          itemBuilder: (context,index){

            return Padding(
              padding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                margin: EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                width: 80,

                decoration: BoxDecoration(
                  // You can replace this with color from data.colors[index] if available

                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Appcolors.grey_text_color,width: 3)
                ),
                child:  Text(data.colors[index].attrValue ?? '',style: robotoRegular.copyWith(fontSize: 12,color: Appcolors.grey_text_color),textAlign: TextAlign.center,),
              ),
            );



          });


    });

  }
}
