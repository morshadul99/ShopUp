import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop_up/common_widgets/AppIcons.dart';
import 'package:shop_up/common_widgets/custom_button_widget.dart';
import 'package:shop_up/common_widgets/custom_carousel_slider.dart';
import 'package:shop_up/features/home/controller/home_controller.dart';
import 'package:shop_up/features/home/screens/colors_item_screen.dart';
import 'package:shop_up/routes/routes_names.dart';
import 'package:shop_up/utils/app_constants.dart';
import 'package:shop_up/utils/colors.dart';
import 'package:shop_up/utils/dimentions.dart';
import 'package:shop_up/utils/fonts_style.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  


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
        title: Text("Product Details",style: TextStyle(color: Appcolors.white_color),),
      ),

      body: GetBuilder<HomeController>(
        builder: (controller) {

          var data = controller.productDetailsModel;

          return SingleChildScrollView(
            child: Column(
              children: [
            
                CustomCarouselSlider(
                    imageUrls: controller.productDetailsModel.product!.subImages!.map((e) => e.subImage!).toList()
                ),
            
               const SizedBox(height: Dimensions.paddingSizeDefault,),
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            
                      Text("${data.product!.name}",style: robotoMedium,),


                      const SizedBox(height: Dimensions.paddingSizeExtraSmall,),

                      Text("Discount available : ${data!=null?data!.product!.discount:''}%",style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),


                      const SizedBox(height: Dimensions.paddingSizeExtraSmall,),

                      Row(
                        children: [

                          Text("Price : ৳${data!=null?data!.product!.sellPrice:''}",style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),


                          const SizedBox(width: Dimensions.paddingSizeExtraSmall,),

                          Text("৳${data!=null?data!.product!.regularPrice:''}",style: robotoMedium.copyWith(color: Appcolors.redColor,decoration: TextDecoration.lineThrough),),


                        ],
                      ),

                      const SizedBox(height: Dimensions.paddingSizeExtraSmall,),


                      //colors list
                      Row(
                        children: [


                          Text("Colors : ",style: robotoMedium,),

                         const SizedBox(width: Dimensions.paddingSizeExtraSmall,),

                          // colors  items
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child:   ListView.builder(

                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: data.colors.length,
                                itemBuilder: (context,index){


                                  return InkWell(
                                    onTap: () {

                                      controller.selectedOption(index);

                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                                        margin: EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                                        width: 80,
                                    
                                        decoration: BoxDecoration(
                                          // You can replace this with color from data.colors[index] if available

                                          color: controller.selectedIndex == index ? Appcolors.primary_color.withOpacity(0.2) : Appcolors.white_color,
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(color: controller.selectedIndex == index ? Appcolors.primary_color : Appcolors.grey_text_color,width: 3)
                                        ),
                                        child:  Text(data.colors[index].attrValue ?? '',style: robotoRegular.copyWith(fontSize: 12,color: Appcolors.grey_text_color),textAlign: TextAlign.center,),
                                      ),
                                    ),
                                  );



                                }),

                          ),
                          ),


                        ],
                      ),

                      const SizedBox(height: Dimensions.paddingSizeDefault,),


                      Row(
                        children: [


                          Text("Sizes : ",style: robotoMedium,),

                          const SizedBox(width: Dimensions.paddingSizeExtraSmall,),

                          // colors  items
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child:   ListView.builder(

                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: data.sizes.length,
                                  itemBuilder: (context,index){

                                    return InkWell(
                                      onTap: () {

                                        controller.selectedSizeOption(index);

                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall),
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                                          margin: EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                                          width: 80,

                                          decoration: BoxDecoration(
                                            // You can replace this with color from data.colors[index] if available

                                              color: controller.selectedSizeIndex== index? Appcolors.primary_color.withOpacity(0.2) : Appcolors.white_color,
                                              borderRadius: BorderRadius.circular(12),
                                              border: Border.all(color:controller.selectedIndex == index ? Appcolors.primary_color : Appcolors.grey_text_color,width: 3)
                                          ),
                                          child:  Text(data.sizes[index].attrValue ?? '',style: robotoRegular.copyWith(fontSize: 12,color: Appcolors.grey_text_color),textAlign: TextAlign.center,),
                                        ),
                                      ),
                                    );



                                  }),

                            ),
                          ),


                        ],
                      ),


                      const SizedBox(height: Dimensions.paddingSizeDefault,),


                      Text("Description :",style: robotoMedium,),

                      Html(
                      data: data!=null?data!.product!.longDescription:'',

                      ),

                     // const SizedBox(height: Dimensions.paddingSizeExtraSmall,),

                      customButton(

                          text: "Add to cart",
                          bgColor: Appcolors.redColor,
                          onTap: (){


                            Get.toNamed(RoutesName.cart);
                            print("Add to cart clicked");

                          }
                      ),

                      const SizedBox(height: Dimensions.paddingSizeDefault,),

                      GridView.builder(

                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 1.1,

                          ),

                          itemCount: controller.productDetailsModel.relatedProducts!.length,
                          shrinkWrap: true,
                          itemBuilder:(context,index){

                            var data = controller.productDetailsModel.relatedProducts![index];

                            return InkWell(
                              onTap: () {
                                

                                controller.getProductDetails(data.slug!);

                              },
                              child: Container(

                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Appcolors.white_color,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black12, blurRadius: 4),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                                      child: Image.network(
                                        "${AppConstants.image_url_part}${data.mainImage}",
                                        height: Get.height*0.12,width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                   const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                                   Padding(
                                     padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text(data.name ?? "",maxLines: 1,
                                             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                                         const SizedBox(height: 5),
                                         Text("৳${data.sellPrice}",
                                             style: TextStyle(
                                                 fontSize: 14,
                                                 color: Colors.red,
                                                 fontWeight: FontWeight.bold)),
                                       ],
                                     ),
                                   )
                                  ],
                                ),
                              ),
                            );

                          }

                          )


                    ],
                  ),
                )
            
            
              ],
            ),
          );
        }
      )

    );
  }
}
