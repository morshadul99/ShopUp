
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_up/common_widgets/AppIcons.dart';
import 'package:shop_up/common_widgets/custom_carousel_slider.dart';
import 'package:shop_up/common_widgets/custom_text_field.dart';
import 'package:shop_up/features/auth/auth_controller/auth_controller.dart';
import 'package:shop_up/features/home/controller/home_controller.dart';
import 'package:shop_up/features/home/screens/all_products_items.dart';
import 'package:shop_up/features/home/screens/category_wiseProducts.dart';
import 'package:shop_up/routes/routes_names.dart';
import 'package:shop_up/utils/app_constants.dart';
import 'package:shop_up/utils/colors.dart';
import 'package:shop_up/utils/dimentions.dart';
import 'package:shop_up/utils/fonts_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../common_widgets/custom_dialogue.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final  homeController = Get.put(HomeController());




  @override
  Widget build(BuildContext context) {
   
  return GetBuilder<HomeController>(builder: (homeController){

    return Scaffold(

      resizeToAvoidBottomInset: false,

      backgroundColor: Appcolors.white_color,
      appBar: AppBar(

        toolbarHeight: 2,
        backgroundColor: Appcolors.white_color,
      ),


      body:  homeController.categoryList.isEmpty || homeController.AllProductList.isEmpty ?Center(child: CircularProgressIndicator(),): Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeDefault),
        child: Column(

          children: [


            Container(

              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(

                //border: BoxBorder.all(width: 2,color: Colors.blue),
                borderRadius: BorderRadiusGeometry.circular(30),

                color: Color(0xFFF1F5F9)
              ),

              child: TextField(

                cursorHeight: 18,
                controller: homeController.searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(AppIcons.search),

                  contentPadding: EdgeInsets.only(top: 12),
                  hintText: "search..",
                  suffixIcon: IconButton(onPressed: (){

                    homeController.searchController.clear();
                  }, icon: Icon(Icons.cancel,color: Appcolors.redColor,)),

                  border: InputBorder.none

                ),
              )
            ),

            SizedBox(height: Dimensions.paddingSizeDefault,),


            //carrousel slider start now


            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    CustomCarouselSlider(),

                    SizedBox(height: Dimensions.paddingSizeSmall,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("All Category",style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
                        Text("See more",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,color: Appcolors.grey_text_color),),

                      ],
                    ),


                    SizedBox(height: Dimensions.paddingSizeDefault,),

                    //category horizontal scrollview start now
                    SizedBox(
                      height: Get.height*0.15,
                      child: homeController.categoryList.isEmpty? Center(child: CircularProgressIndicator()): ListView.builder(
                        shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                        itemCount: homeController.categoryList.length,
                          itemBuilder: (context,index){

                          var data = homeController.categoryList[index];

                        return InkWell(
                          onTap: () {

                            homeController.getCateGoryProducts(homeController.categoryList[index].catCode.toString());

                            Get.to(CategoryWiseproducts(

                                catCode: homeController.categoryList[index].catCode.toString(),
                              catName: homeController.categoryList[index].name.toString(),

                            )
                            );

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
                            child: Container(
                              decoration: BoxDecoration(

                              ),
                              child:Column(
                                children: [

                                  ClipRRect(
                                      child: Image(image: NetworkImage("${AppConstants.image_url_part}${data.image}"),height: 80,width: 80,fit: BoxFit.cover,),

                                  borderRadius: BorderRadiusGeometry.circular(16),
                                  ),

                                  SizedBox(height: Dimensions.paddingSizeSmall,),

                                  Text(
                                      "${data.name}".split(' ').take(1).join(''),style: robotoRegular,
                                  ),





                                ],
                              ) ,
                            ),
                          ),
                        );
                      }),

                    ),

                    SizedBox(height: Dimensions.paddingSizeSmall,),

                    Text("All Products",style: robotoMedium,),

                    SizedBox(height: Dimensions.paddingSizeDefault,),


                    GridView.builder(

                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(



                          mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                        ),

                        itemCount: homeController.AllProductList.length,
                        itemBuilder: (context,index){

                          var data = homeController.AllProductList[index];

                          return AllProductsItems(

                            index: index,

                          );


                        })






                  ],
                ),
              ),
            ),




          ],
        ),
      ),


    );

  });

  }
}
