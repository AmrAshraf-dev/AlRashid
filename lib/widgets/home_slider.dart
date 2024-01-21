import 'package:alrashid_mall_app/api/controllers/home_controller.dart';
import 'package:alrashid_mall_app/models/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    Sliders slidersModel = Sliders();
    // const String _img =
    //     "https://i.knwt.co/nihan/212TN5328NH1-45345/nihan-nihan-dusuk-kollu-fular-yaka-buy-297-8b_1641725834445.jpg";
    String img2 = Image.asset('assets/images/fashion1.png').toString();
    const String _img =
        'https://www.masterclass.com/cdn-cgi/image/width=828,quality=75,format=webp/https://images.ctfassets.net/3s5io6mnxfqz/3N5iXB8yNlqVQS3xWdIIgX/fa0d654680fbd64eb5852dbbbcf4cca4/AdobeStock_303371265.jpeg';
    return Column(
      children: [
        SizedBox(
          // color: Colors.amber,
          width: double.infinity,
          height: 200,
          child: PageView.builder(
              controller: controller,
              // itemCount: HomeController.slidersModel.name?.length ?? 100,
              itemCount: HomeController.homeModel.sliders?.length ?? 100,
              scrollDirection: Axis.horizontal,
              itemBuilder: (c, i) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 0),
                    child: Stack(
                      children: [
                        HomeController.homeModel.sliders![i].image!
                                .contains('svg')
                            ? SvgPicture.network(
                                HomeController.homeModel.sliders![i].image ??
                                    _img,
                                fit: BoxFit.cover,
                                 height: double.infinity,
                                width: double.infinity,
                              )
                            : CachedNetworkImage(
                                imageUrl: HomeController
                                        .homeModel.sliders![i].image ??
                                    img2,
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                        Image.asset(
                          'assets/images/pexels_delbeautybox_705255.png',
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  )),
        ),
        HomeController.homeModel.sliders?.length == 1
            ? const Offstage()
            : SmoothPageIndicator(
                controller: controller, // PageController
                count: HomeController.homeModel.sliders!.length,
                effect: const WormEffect(
                  dotWidth: 8.0,
                  dotHeight: 8.0,
                  activeDotColor: Color(0xffb83f48),
                ), // your preferred effect
                onDotClicked: (index) {
                  HomeController.homeModel.sliders != null &&
                      HomeController.homeModel.sliders!.length > index;
                  controller.animateToPage(index,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInBack);
                }),
      ],
    );
  }
}
