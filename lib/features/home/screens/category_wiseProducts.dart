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



                    homeController.getClickedItemIndex(index);
                    Get.toNamed(RoutesName.categoryProductsDetails);
                    print("category Item Clicked $index");

                  },

                  child: Container(


                    height: Get.height*0.37,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadiusGeometry.circular(12),

                    ),
                    child: Stack(
                      children: [

                        Image(image: NetworkImage("${AppConstants.image_url_part}${data.mainImage}"),height: 90,),

                        Positioned(

                          bottom: 10,
                            left: 2,
                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.name??"".split('').take(2).join(''),maxLines: 2,),
                            SizedBox(height: Dimensions.paddingSizeSmall,),
                            Text("Tk : ${data.regularPrice}")
                          ],
                        ))

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
