import 'package:bukara/app/providers/shared/common_modele.dart';
import 'package:bukara/app/providers/suite/modele.dart';
import 'package:bukara/app/ui/Screens/deatil_page.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Suite extends StatelessWidget {
  final SuiteModel? suite;
  const Suite({Key? key, this.suite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.pushNamed(context, Details.routeName);
        },
        child: Column(
          children: [
            SuiteImage(
              images: suite!.images!,
            ),
            10.heightBox,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Suite name",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.BLACK_COLOR,
                        ),
                      ),
                      const Text(
                        "Manager name",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.SECOND_TEXT_COLOR,
                        ),
                      ),
                      const Text(
                        "10 dec - 3 mars",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.SECOND_TEXT_COLOR,
                        ),
                      ),
                      10.heightBox,
                      const Text(
                        "150 \$ par Mois",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColors.BLACK_COLOR),
                      ),
                    ],
                  ),
                ),
                15.widthBox,
                Container(
                  height: 35,
                  width: 60,
                  decoration: BoxDecoration(
                      color: AppColors.DISABLE_COLOR,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(child: Text("Yes")),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SuiteImage extends StatefulWidget {
  final List<ImageModel> images;
  const SuiteImage({Key? key, required this.images}) : super(key: key);

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
              height: 280,
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
