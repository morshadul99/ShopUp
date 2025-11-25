import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_up/utils/colors.dart';
import 'package:shop_up/utils/fonts_style.dart';

void showLogoutDialog(BuildContext context, VoidCallback onLogout,String title,message) {
  showDialog(
    context: context,
    barrierDismissible: false, // user can’t dismiss by tapping outside
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
              style: robotoMedium.copyWith(color: Appcolors.redColor),),
              SizedBox(height: 15),
              Text(
              message,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Cancel Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                    ),
                    onPressed: () {
                      Get.back(); // close dialog
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                  // Logout Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      Get.back(); // close dialog
                      onLogout(); // call logout function
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
