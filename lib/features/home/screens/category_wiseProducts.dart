import 'package:flutter/material.dart';
import 'package:shop_up/common_widgets/AppIcons.dart';
import 'package:shop_up/features/home/controller/home_controller.dart';

import 'package:get/get.dart';
import 'package:shop_up/routes/routes_names.dart';
import 'package:shop_up/utils/app_constants.dart';
import 'package:shop_up/utils/colors.dart';
import 'package:shop_up/utils/dimentions.dart';

class CategoryWiseproducts extends StatefulWidget {

  String? catName,catCode;

   CategoryWiseproducts({super.key, this.catCode,this.catName});

  @override
  State<CategoryWiseproducts> createState() => _CategoryWiseproductsState();
}

class _CategoryWiseproductsState extends State<CategoryWiseproducts> {

  final HomeController homeController = Get.put(HomeController());



  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(builder: (controller){

      return Scaffold(

        appBar: AppBar(

          leading: IconButton(

              onPressed: (){
                Get.back();
              },
              icon: Icon(AppIcons.backArrow,color: Appcolors.white_color,)),
          backgroundColor: Appcolors.primary_color,
          title: Text("${widget.catName}",style: TextStyle(color: Appcolors.white_color),),
        ),

        body: controller.isLoading == true?Center(child: CircularProgressIndicator()): Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeDefault),
          child: controller.categoryProductList.isEmpty? Center(child: Text("No Product Found!"),): GridView.builder(

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2
              ),
              itemCount: controller.categoryProductList.length,
              itemBuilder: (context,index){

                var data = controller.categoryProductList[index];
                return InkWell(

                  onTap: () {


                   controller.getProductDetails(data.slug.toString())
                       .then((value){


                         Get.toNamed(RoutesName.allProductDetails);

                   });



                    
                  },

                  child:  Container(
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
                height: 100,width: double.infinity,
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
                ),
                );
              }),
        ),

      );

    });
  }
}
