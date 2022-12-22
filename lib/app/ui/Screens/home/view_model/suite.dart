import 'package:bukara/app/ui/Screens/deatil_page.dart';
import 'package:bukara/app/ui/shared/style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

List<String> images = [
  "assets/images/appart1.jpg",
  "assets/images/appart2.jpg",
  "assets/images/appart3.jpg",
  "assets/images/appart3.jpg",
  "assets/images/appart3.jpg",
];

class Suite extends StatelessWidget {
  const Suite({Key? key}) : super(key: key);

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
              images: images,
            ),
            10.heightBox,
            card()
          ],
        ),
      ),
    );
  }
}

Widget card() {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titlehome("Suite name"),
                subtitlehome("Manager name"),
                subtitlehome("10 dec - 3 mars"),
                const SizedBox(
                  height: 10,
                ),
                subtitle2home("150 \$ par Mois"),
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
  );
}

Widget titlehome(String message) {
  return SizedBox(
    // width: 50,
    child: Text(
      message,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.BLACK_COLOR,
      ),
    ),
  );
}

Widget subtitlehome(String subtitle) {
  return SizedBox(
    // width: 50,
    child: Text(
      subtitle,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 15,
        color: Color.fromARGB(169, 168, 167, 167),
      ),
    ),
  );
}

Widget subtitle2home(String subtitle) {
  return SizedBox(
    // width: 50,
    child: Text(
      subtitle,
      textAlign: TextAlign.left,
      style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: AppColors.BLACK_COLOR),
    ),
  );
}

class SuiteImage extends StatefulWidget {
  final List<String> images;
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
                    image: AssetImage(
                      images[index],
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
                images.length,
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
