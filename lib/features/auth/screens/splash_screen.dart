import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_up/features/home/controller/home_controller.dart';
import 'package:shop_up/routes/routes_names.dart';
import 'package:shop_up/utils/app_constants.dart';
import 'package:shop_up/utils/colors.dart';
import 'package:shop_up/utils/dimentions.dart';
import 'package:shop_up/utils/fonts_style.dart';
import 'package:shop_up/utils/images.dart';

import '../../home/screens/bottom_navigationBar.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  final HomeController  homeController = Get.put(HomeController());


  @override
  void initState() {

    setRoute();

    // TODO: implement initState
    super.initState();
  }


  setRoute()async{

    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("${AppConstants.token}");
    print("User token issssssssssssssssss${token}");
    if(token==null){

      await homeController.loadAllData();
      Get.off(LoginScreen());


    }else{


     await homeController.loadAllData();

        Get.off(BottomNavigationbar());


    }

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(


      body:Container(

        width: double.infinity,

        decoration: BoxDecoration(

          color: Appcolors.primary_color,
          
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image(image: AssetImage("${Images.splash_logo}"),height: Get.height*0.3,),




              CircularProgressIndicator(),


            ],
          ),
        )
      )


    );
  }
}
