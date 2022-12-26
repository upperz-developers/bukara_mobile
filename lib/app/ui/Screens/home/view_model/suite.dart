import 'package:bukara/app/providers/shared/common_modele.dart';
import 'package:bukara/app/providers/suite/modele.dart';
import 'package:bukara/app/ui/Screens/deatil_page.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:bukara/app/ui/shared/utils/widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Suite extends StatelessWidget {
  final SuiteModel? suite;

  const Suite({
    Key? key,
    this.suite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.pushNamed(context, Details.routeName);
        },
        child: Column(
          children: [
            if (suite!.images!.isNotEmpty)
              Column(
                children: [
                  SuiteImage(
                    images: suite!.images!,
                  ),
                  15.heightBox,
                ],
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Suite name",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.BLACK_COLOR,
                          ),
                          children: [
                            TextSpan(
                              text: " - #num ${suite!.number!}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "(${suite!.features!.bedroom} chambres - ${suite!.features!.livingroom} salon)",
                      ),
                      // 8.heightBox,
                      if (suite!.status!)
                        const Text(
                          "Manager name - 10 dec - 3 mars",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.SECOND_TEXT_COLOR,
                          ),
                        ),
                      15.heightBox,
                      Text(
                        "${suite!.price} \$ par mois",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.BLACK_COLOR),
                      ),
                    ],
                  ),
                ),
                15.widthBox,
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.DISABLE_COLOR,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    suite!.status! ? "Occupé" : "inoccupé",
                  ),
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
