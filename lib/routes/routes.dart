import 'package:get/get.dart';
import 'package:shop_up/features/auth/screens/login_screen.dart';
import 'package:shop_up/features/auth/screens/register_screens.dart';
import 'package:shop_up/features/auth/screens/splash_screen.dart';
import 'package:shop_up/features/cart/screens/cart_screen.dart';
import 'package:shop_up/features/home/screens/bottom_navigationBar.dart';
import 'package:shop_up/features/home/screens/category_product_details.dart';
import 'package:shop_up/features/home/screens/category_wiseProducts.dart';
import 'package:shop_up/features/home/screens/home_screen.dart';
import 'package:shop_up/features/home/screens/product_details_screen.dart';
import 'package:shop_up/features/profile/screens/profile_screen.dart';
import 'package:shop_up/routes/routes_names.dart';

class Routes{

  static app_routes ()=>[

    GetPage(

        name: RoutesName.splash,
        page: ()=>SplashScreen(),
    ),
    GetPage(

        name: RoutesName.login,
        page: ()=>LoginScreen()
    ),
    GetPage(

        name: RoutesName.register,
        page: ()=>RegisterScreens()
    ),

    GetPage(
        name:RoutesName.home,
        page: ()=>HomeScreen(),

    ),

    GetPage(

        name: RoutesName.categoryProducts,
        page: ()=>CategoryWiseproducts()
    ),

    GetPage(
        name:RoutesName.categoryProductsDetails,
        page: ()=>CategoryProductDetails()
    ),

    GetPage(
        name: RoutesName.allProductDetails,
        page: ()=>ProductDetailsScreen()
    ),

    GetPage(

        name: RoutesName.bottomNavigation,
        page: ()=>BottomNavigationbar()
    ),
    GetPage(

        name: RoutesName.profile,
        page: ()=>ProfileScreen()
    ),
    GetPage(

        name: RoutesName.cart,
        page: ()=>CartScreen()
    ),




  ];


}