
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:shop_up/utils/app_constants.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<String> imageUrls;

  CustomCarouselSlider({super.key, required this.imageUrls});

  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: Get.height * 0.25,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.imageUrls.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                
                //print("image url in carousel slider is ${AppConstants.image_url_part}${imageUrl.replaceAll('./', '')}");
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),

                    child: Image.network(
                      '${AppConstants.image_url_part}${imageUrl.replaceAll('./', '')}',
                      fit: BoxFit.cover
                    )
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 10),

      ],
    );
  }
}
