import 'package:bukara/app/providers/shared/common_modele.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationSquelleton extends StatelessWidget {
  const NotificationSquelleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Shimmer(
        color: Colors.grey.withAlpha(10),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.DISABLE_COLOR,
          ),
        ),
      ),
    );
  }
}

class SuiteImage extends StatefulWidget {
  final double height;
  final List<ImageModel> images;
  const SuiteImage({Key? key, required this.images, required this.height})
      : super(key: key);

  @override
  State<SuiteImage> createState() => _SuiteImageState();
}

class _SuiteImageState extends State<SuiteImage> {
  ValueNotifier<int> pageIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          CarouselSlider(
            items: List.generate(
              widget.images.length,
              (index) => Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.DISABLE_COLOR,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      widget.images[index].url!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              height: widget.height,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (int page, reason) {
                pageIndex.value = page;
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Wrap(
              spacing: 5,
              alignment: WrapAlignment.center,
              children: List.generate(
                widget.images.length,
                (index) => ValueListenableBuilder(
                    valueListenable: pageIndex,
                    builder: (context, int page, child) {
                      return Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: page == index
                              ? AppColors.BLACK_COLOR
                              : AppColors.DISABLE_COLOR,
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
