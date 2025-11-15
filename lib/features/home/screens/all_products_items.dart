import 'package:flutter/material.dart';
import 'package:shop_up/features/home/controller/home_controller.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/dimentions.dart';
import 'package:get/get.dart';

class AllProductsItems extends StatelessWidget {

  int? index;

   AllProductsItems({super.key,this.index});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {



    return GetBuilder<HomeController>(
      builder: (controller) {


        var data = controller.AllProductList[index!];

        return Container(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "${AppConstants.image_url_part}${data.mainImage}",
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5),
              Text(data.name ?? "",maxLines: 1,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              SizedBox(height: 5),
              Text("৳${data.sellPrice}",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        );
      }
    );
  }
}
