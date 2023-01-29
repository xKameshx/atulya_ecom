import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSliderDem extends StatelessWidget {
  List<String> li = [
    'assets/app/1.jpeg',
    'assets/app/2.jpeg',
    'assets/app/3.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    // print(li);
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        initialPage: 0,
        // pageSnapping: false,
        autoPlay: true,
      ),
      items: li
          .map((item) => SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 30,
                child: Image.asset(
                  item,
                  fit: BoxFit.fitWidth,
                ),
              ))
          .toList(),
    ));
  }
}
