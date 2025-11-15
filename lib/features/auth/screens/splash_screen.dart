import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_up/routes/routes_names.dart';
import 'package:shop_up/utils/colors.dart';
import 'package:shop_up/utils/dimentions.dart';
import 'package:shop_up/utils/fonts_style.dart';
import 'package:shop_up/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    SplashPageDelayed();

    // TODO: implement initState
    super.initState();
  }

  void SplashPageDelayed(){

    Future.delayed(Duration(seconds: 4),(){

      Get.toNamed(RoutesName.login);

    });

  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(


      body:Container(

        width: double.infinity,

        decoration: BoxDecoration(

          color: Appcolors.primary_color,
          
        ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                
                Image(image: AssetImage("${Images.white_carrote}")),
                SizedBox(width: Dimensions.paddingSizeSmall,),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("EasyShop",style: robotoOverLarge.copyWith(color: Appcolors.white_color,fontSize: 40,fontWeight: FontWeight.w700),),

                    Text("EasyLife For EasyShop",style: robotoOverLarge.copyWith(color: Appcolors.white_color,fontSize: Dimensions.fontSizeLarge,fontWeight: FontWeight.w700),),


                  ],
                )

              ],
            )
            
            
          ],
        ),
      )


    );
  }
}
