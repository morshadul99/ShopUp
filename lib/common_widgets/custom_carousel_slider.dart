import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_up/features/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:shop_up/utils/dimentions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/app_constants.dart';

class CustomCarouselSlider extends StatelessWidget {
   CustomCarouselSlider({super.key});

  final HomeController homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(builder: (controller){

      // if(controller.isLoading == true || controller.imageSliderModel == null || controller.imageSliderModel.sliders == null){
      //
      //   return Center(child: CircularProgressIndicator(),);
      // }

      return Column(
        children: [
          CarouselSlider.builder(
            itemCount: homeController.imageSliderModel.sliders!.length,
            itemBuilder: (context, index, realIndex) {

              var data = homeController.imageSliderModel.sliders![index];

              return InkWell(

                onTap: () {



                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network("${AppConstants.image_url_part}${data.image}",
                      fit: BoxFit.cover, width: double.infinity),
                ),
              );
            },

            options: CarouselOptions(
              height: Get.height*0.22,
              autoPlay: true,

              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {

                controller.getActiveIndex(index);


              },
            ),
          ),

         const SizedBox(height: Dimensions.paddingSizeDefault,),


        ],
      );
    });
  }
}
