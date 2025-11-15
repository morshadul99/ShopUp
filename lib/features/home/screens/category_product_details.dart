import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shop_up/common_widgets/AppIcons.dart';
import 'package:shop_up/common_widgets/custom_button_widget.dart';
import 'package:shop_up/features/home/controller/home_controller.dart';
import 'package:shop_up/utils/app_constants.dart';
import 'package:shop_up/utils/colors.dart';
import 'package:shop_up/utils/dimentions.dart';
import 'package:shop_up/utils/fonts_style.dart';


class CategoryProductDetails extends StatefulWidget {
  const CategoryProductDetails({super.key});

  @override
  State<CategoryProductDetails> createState() => _CategoryProductDetailsState();
}

class _CategoryProductDetailsState extends State<CategoryProductDetails> {


  final HomeController homeController = Get.find<HomeController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(


        backgroundColor: Appcolors.primary_color,

        leading: InkWell(

          onTap: () {

            Get.back();
          },
            child: Icon(AppIcons.backArrow,color: Appcolors.white_color,)),
        title: Text("Category Product Details",style: robotoOverLarge.copyWith(color: Appcolors.white_color,fontWeight: FontWeight.w700),),

      ),

      body:GetBuilder<HomeController>(builder: (controller){

        var data = controller.categoryProductList[controller.clickedItemIndex];
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            Container(
              width: double.infinity,
              color: Colors.blue,
              height: Get.height*0.3,
              child: Image(image: NetworkImage("${AppConstants.image_url_part}${data.mainImage}"),fit: BoxFit.cover,),
            ),

            SizedBox(height: Dimensions.paddingSizeSmall,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeDefault),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Text("${data.name??""}",style: robotoOverLarge.copyWith(color: Color(0xFF1A1A1A))),

                  Text("Model : ${data.model}",style: robotoRegular.copyWith(color: Appcolors.grey_text_color),),

                  SizedBox(height: Dimensions.paddingSizeSmall,),
                  Text("Discount available : ${data.discount}%",style: robotoMedium.copyWith(color: Appcolors.redColor),),
                  SizedBox(height: Dimensions.paddingSizeSmall,),



                  SizedBox(height: Dimensions.paddingSizeSmall,),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Row(
                        children: [
                        
                        IconButton(
                          onPressed: (){

                            if(controller.count>0){

                              controller.counterDecreement();
                            }

                          },
                            icon: Icon(FontAwesomeIcons.subtract,color: Appcolors.grey_text_color,),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                          child: Text("${controller.count}",style: robotoOverLarge.copyWith(color: Appcolors.redColor)),
                        ),

                        IconButton(
                          onPressed: (){



                            controller.counterIncreement();


                          },
                          icon: Icon(FontAwesomeIcons.add,color: Appcolors.primary_color,),
                        ),

                        

                      ],
                      ),

                      Row(

                        children: [

                          Icon(FontAwesomeIcons.dollar,size: 18,color: Appcolors.redColor,),
                          Text("${data.sellPrice}",style: robotoMedium.copyWith(color: Appcolors.redColor),)

                        ],
                      )

                    ],
                  ),


                  SizedBox(height: Dimensions.paddingSizeSmall,),
                  
                  Text("Descriptions : ${data.shortDescription?.replaceAll(r'\n\r', '\n')}"),

                  SizedBox(height: Dimensions.paddingSizeDefault,),

                  Row(
                    children: [

                      Expanded(
                          child: customButton(
                              text: "Add to cart",
                              bgColor: Appcolors.redColor,
                              onTap: (){

                              }
                          )
                      ),
                      SizedBox(width: Dimensions.paddingSizeSmall,),
                      Expanded(
                          child: customButton(
                              text: "Buy now",
                              onTap: (){

                              }
                          )
                      ),


                    ],
                  )

                ],
              ),
            )

          ],
        );


      }) ,
    );
  }
}
