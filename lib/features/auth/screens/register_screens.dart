import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_up/features/auth/auth_controller/auth_controller.dart';

import '../../../common_widgets/custom_button_widget.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../routes/routes_names.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimentions.dart';
import '../../../utils/fonts_style.dart';


class RegisterScreens extends StatefulWidget {
  const RegisterScreens({super.key});

  @override
  State<RegisterScreens> createState() => _RegisterScreensState();
}

class _RegisterScreensState extends State<RegisterScreens> {


  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Appcolors.white_color,


      body: GetBuilder<AuthController>(builder: (authController){

        return Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        SizedBox(height: 100),


        Align(
          
          alignment: Alignment.center,

          child: InkWell(
            onTap: () {

              // Image picker

              authController.pickImage();
              print("picked Image %%%%%%");
            },
            child: Stack(
              children: [

                CircleAvatar(

                  backgroundColor: Colors.grey[300],
                  child: authController.imagePath == null? Icon(FontAwesomeIcons.user,size: 60,color: Colors.grey,):

                  ClipRRect(

                    borderRadius: BorderRadiusGeometry.circular(50),
                      child: Image.file(File(authController.imagePath!.path),fit: BoxFit.fill,height: 100,width: 100,)),
                  radius: 50,

                ),

              ],
            ),
          ),
        ),

        SizedBox(height: 20),

        Text("Enter your name :",style: robotoMedium.copyWith(color: Appcolors.grey_text_color),),
          SizedBox(height: 8),
        custom_text_field(

          controller: authController.nameController,
            fillColor: Appcolors.white_color,
            prefixIcon: FontAwesomeIcons.user,

            obSecure: false,
            hintext:"name",

        ),
          SizedBox(height: 12),

        Text(
        "Enter your email :",
        style: robotoMedium.copyWith(color: Appcolors.grey_text_color),
        ),

        SizedBox(height: 8),
        custom_text_field(

        controller: authController.emailController,

        hintext: "xyz@gamil.com",
        obSecure: false,
        fillColor: Appcolors.white_color,
        prefixIcon: Icons.email_outlined,
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

        controller: authController.passwordController,
        fillColor: Appcolors.white_color,
        prefixIcon: Icons.lock_clock_outlined,
        sufixIcon: authController.isPassword == true? Icons.visibility:Icons.visibility_off,

        obSecure: authController.isPassword == true ? false:true,
        onTap: (){


        authController.setVisiblityIcon();

        },
        hintext: "******",
        validator: (value){

        }

        ),

        SizedBox(height: 16,),

        customButton(

        text: "Register",
        onTap: (){

          authController.getRegister();


        }



        ),

        SizedBox(height: 8,),
        Row(
        children: [
        Text("Do you have an account?",style: robotoRegular.copyWith(color: Appcolors.grey_text_color,fontSize: 14,fontWeight: FontWeight.w400),),
        SizedBox(width: 2,),

        InkWell(
        onTap: () => Get.toNamed(RoutesName.login),
        child: Text("Login",style: robotoRegular.copyWith(color: Appcolors.primary_color,fontWeight: FontWeight.w500),))
        ],
        ),
        SizedBox(height: 12,),

        ],
        ),
        );



      }),

    );
  }
}
