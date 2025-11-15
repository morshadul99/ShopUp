import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_up/common_widgets/custom_button_widget.dart';
import 'package:shop_up/common_widgets/custom_text_field.dart';
import 'package:shop_up/features/auth/auth_controller/auth_controller.dart';
import 'package:shop_up/routes/routes_names.dart';
import 'package:shop_up/utils/colors.dart';
import 'package:shop_up/utils/dimentions.dart';
import 'package:shop_up/utils/fonts_style.dart';

import '../../../utils/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthController authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {

   return GetBuilder<AuthController>(builder: (controller){

     return Scaffold(
       resizeToAvoidBottomInset: false,

       body: Padding(
         padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
         
         
            // Image(image: AssetImage("${Images.red_carrote}")),

             SizedBox(height:Dimensions.paddingSizeExtraOverLarge,),

             Container(
         
         
               height: Get.height*0.3,
               decoration: BoxDecoration(
         
                 image: DecorationImage(image: AssetImage("${Images.big_carrote}",),),
         
               ),
             ),
         
         

         
             Text(
               "Loging",
               style: robotoLarge.copyWith(
                 color: Appcolors.black_text_color,
                 fontSize: 26,
                 fontWeight: FontWeight.w600,
               ),
             ),
             Text(
               "Enter your email and password to ",
               style: robotoRegular.copyWith(
                 color: Appcolors.grey_text_color,
                 fontSize: 16,
                 fontWeight: FontWeight.w400,
               ),
             ),
             SizedBox(height: 20),
         
             Text(
               "Enter your email :",
               style: robotoMedium.copyWith(color: Appcolors.grey_text_color),
             ),
         
             SizedBox(height: 8),


             custom_text_field(
         
               controller: controller.emailController,

                 obSecure: false,
                 hintext: "xyz@gamil.com",
                 prefixIcon: Icons.email_outlined,
                 fillColor: Appcolors.white_color,
                 validator: (value){
         
                   if(value!.isEmpty){
         
                     return "Enter your email";
                   }
                   if(value.contains('@')==false){
                     return "Enter your valid email";
                   }
                   return null;
         
                 }
         
             ),
             SizedBox(height: 12),
         
             Text(
               "Enter your password :",
               style: robotoMedium.copyWith(color: Appcolors.grey_text_color),
             ),
         
             SizedBox(height: 8),
         
             custom_text_field(
         
               controller: controller.passwordController,

                 prefixIcon: Icons.password_outlined,
                 sufixIcon: controller.isPassword == true? Icons.visibility:Icons.visibility_off,
                 fillColor: Appcolors.white_color,
                 obSecure: controller.isPassword == true? false:true,
                 onTap: (){
         
         
                   controller.setVisiblityIcon();
         
                 },
                 hintext: "******",
                 validator: (value){

                if(value!.isEmpty){

                  Get.snackbar(

                      "Password Null",
                      "Enter your password",
                    backgroundColor: Appcolors.primary_color,
                    colorText: Appcolors.white_color
                  );
                  if(value.length > 6){

                    Get.snackbar(

                        "Passwrd Invalid!",
                        "Enter your valid Password, Max 6 character",
                        backgroundColor: Appcolors.primary_color,
                        colorText: Appcolors.white_color
                    );
                    return ;

                  }
                }

                 }
         
             ),
         
             SizedBox(height: 16,),
         
             customButton(
         
                 text: "LOGIN",
                 onTap: (){
         
                   controller.getLogin();
         
                 }
         
         
         
             ),
         
             SizedBox(height: 8,),
             Row(
               children: [
                 Text("Don't have account?",style: robotoRegular.copyWith(color: Appcolors.grey_text_color,fontSize: 14,fontWeight: FontWeight.w400),),
                 SizedBox(width: 2,),
         
                 InkWell(
                     onTap: () => Get.toNamed(RoutesName.register),
                     child: Text("Register",style: robotoRegular.copyWith(color: Appcolors.primary_color,fontWeight: FontWeight.w500),))
               ],
             ),
             SizedBox(height: 12,),
         
           ],
         ),
       ),


     );


   });

  }
}
