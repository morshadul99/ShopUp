import 'package:flutter/cupertino.dart';
import 'package:shop_up/utils/colors.dart';

Widget customButton({
  required String text,
  required VoidCallback onTap,
  Color bgColor = Appcolors.primary_color,
  Color textColor = Appcolors.white_color,
  double radius = 12,
  double height = 50,
  double fontSize = 16,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
