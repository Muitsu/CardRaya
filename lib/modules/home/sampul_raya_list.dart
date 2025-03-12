import 'package:animations/animations.dart';
import 'package:card_raya/constants/sampul_data.dart';
import 'package:card_raya/modules/sampul/sampul_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InfiniteCarousel extends StatelessWidget {
  final transitionType = ContainerTransitionType.fade;
  final List<SampulData> images = SampulData.values;

  InfiniteCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
        height: size.height * .7,
        aspectRatio: 294 / 584,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.55,
        enableInfiniteScroll: true,
      ),
      itemBuilder: (context, index, realIndex) {
        return OpenContainer<bool>(
            transitionType: transitionType,
            openBuilder: (context, action) => SampulPage(
                  sampulData: images[index],
                ),
            closedBuilder: (BuildContext _, VoidCallback openContainer) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(images[index].image),
                    fit: BoxFit.cover,
                  ),
                ),
              ).animate().shake(hz: 5, curve: Curves.easeInOut);
            });
      },
    );
  }
}
