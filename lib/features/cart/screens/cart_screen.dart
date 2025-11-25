import 'package:flutter/material.dart';
import 'package:shop_up/common_widgets/AppIcons.dart';
import 'package:shop_up/utils/colors.dart';

import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(AppIcons.backArrow,color: Appcolors.white_color,)),
        title: Text('Cart Screen',style: TextStyle(color: Appcolors.white_color),),
        backgroundColor: Appcolors.primary_color,
      ),


      body: Container(

        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
              
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context,index){
              
                return ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Cart Item ${index+1}'),
                  subtitle: Text('Item details here'),
                  trailing: Text('\$${(index + 1) * 10}'),
                );
              
              }
                ),
            ),
          ],
        ),
      ),

    );
  }
}
