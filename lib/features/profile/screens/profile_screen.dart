import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop_up/common_widgets/custom_button_widget.dart';
import 'package:shop_up/features/auth/auth_controller/auth_controller.dart';
import 'package:shop_up/utils/colors.dart';
import 'package:shop_up/utils/dimentions.dart';
import 'package:shop_up/utils/fonts_style.dart';

import '../../../utils/images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile Screen',style: TextStyle(color: Appcolors.white_color),),
        backgroundColor: Appcolors.primary_color,
      ),

      body: GetBuilder<AuthController>(
        builder: (controller) {
          return Container(

             padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),

            child: Column(

              children: [

                const SizedBox(height: Dimensions.paddingSizeDefault,),
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(100),
                      child: CircleAvatar(
                          radius: 60,
                          child: Image(image: AssetImage('${Images.splash_logo}'),height: 100,))),
                ),
                const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
                Text('John Doe',style: robotoLarge.copyWith(color: Appcolors.primary_color,fontSize: Dimensions.fontSizeExtraLarge,fontWeight: FontWeight.w700,),),
                Text('mdmorshadulislam275@gmail.com',style: robotoLarge.copyWith(color: Appcolors.grey_text_color,fontSize: Dimensions.fontSizeDefault,fontWeight: FontWeight.w700,),),

                const SizedBox(height: Dimensions.paddingSizeDefault,),

                customButton(

                  text: "Edit Profile", onTap: (){

                },),


              ],
            ),
          );
        }
      ),

    );
  }
}
