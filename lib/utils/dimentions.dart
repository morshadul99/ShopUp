import 'package:get/get.dart';

class Dimensions {
  static double fontSizeOverSmall = Get.context!.width >= 1300 ? 10 : 8;
  static double fontSizeExtraSmall = Get.context!.width >= 1300 ? 12 : 10;
  static double fontSizeSmall = Get.context!.width >= 1300 ? 14 : 12;
  static double fontSizeDefault = Get.context!.width >= 1300 ? 16 : 14;
  static double fontSizeLarge = Get.context!.width >= 1300 ? 18 : 16;
  static double fontSizeExtraLarge = Get.context!.width >= 1300 ? 20 : 18;
  static double fontSizeOverLarge = Get.context!.width >= 1300 ? 26 : 24;
  static double fontSizeSixteen = Get.context!.width >= 1300 ? 16 : 14;
  static double fontSizeEighteen = Get.context!.width >= 1300 ? 18 : 16;


  static const double defaultNumericValue = 5.0;
  static const double paddingSizeExtraSmall = 5.0;
  static   double paddingSizeSmall = Get.context!.width >= 1300? 10.0:8;
  static const double paddingSizeDefault = 16.0;
  static const double paddingSizeLarge = 20.0;
  static const double paddingSizeExtraLarge = 25.0;
  static const double paddingSizeExtremeLarge = 30.0;
  static const double paddingSizeExtraOverLarge = 35.0;

  static const double radiusSmall = 5.0;
  static const double radiusDefault = 10.0;
  static const double radiusLarge = 15.0;
  static const double radiusExtraLarge = 20.0;
  static const double radiusOverLarge = 30.0;

  static const double webMaxWidth = 1170;
}