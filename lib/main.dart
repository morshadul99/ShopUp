import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_up/routes/routes.dart';
import 'package:shop_up/routes/routes_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      initialRoute: RoutesName.home,
      getPages: Routes.app_routes(),


    );
  }
}

