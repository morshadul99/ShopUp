import 'package:flutter/material.dart';

import '../utils/colors.dart';

Widget custom_text_field({

  required String hintext,
  TextEditingController? controller,
  VoidCallback? onTap,
  String? Function(String?)? validator,
  IconData? sufixIcon,
  IconData? prefixIcon,
  bool obSecure = true,

  Color? fillColor,
  Color enable_color = Appcolors.grey_text_color,
  Color focuse_color = Appcolors.primary_color,
}){

  return Container(

    child: TextFormField(

      controller:  controller,

    obscureText: obSecure,

    decoration: InputDecoration(
    hintText: hintext,
    hintStyle: TextStyle(color: Appcolors.grey_text_color),

    filled: true,
    fillColor: fillColor,

    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
    color: enable_color, // normal border color
    width: 1,
    ),
    ),

    // Active / Focused Border
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
    color: focuse_color, // active border color
    width: 2,
    ),
    ),
    
    prefixIcon: Icon(prefixIcon,color: Appcolors.grey_text_color,size: 20,),

    suffixIcon: IconButton(
      onPressed:onTap,

      icon:  Icon( sufixIcon,
        color: Appcolors.grey_text_color,size: 20,),

    ),
    ),
    ),
  );

}