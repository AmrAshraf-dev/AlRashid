import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Services extends StatelessWidget {
  final String? token;
  final String? name;
  final num? serviceID;
  final String? image;
  const Services({Key? key, this.token, this.name, this.serviceID, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _img =
        "https://i.knwt.co/nihan/212TN5328NH1-45345/nihan-nihan-dusuk-kollu-fular-yaka-buy-297-8b_1641725834445.jpg";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 135,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ), //BorderRadius.all
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             image!.contains('svg')
                ? SvgPicture.network(
                    image ?? _img,
                    fit: BoxFit.cover,
                    width: 32.0,
              height: 32.0,
                  )
                :
            CachedNetworkImage(
              imageUrl: image ?? _img,
              width: 32.0,
              height: 32.0,
              fit: BoxFit.cover,
            ),
            // Image.asset(
            //   'assets/icons/g_10.png',
            //   width: 32.0,
            //   height: 32.0,
            // ),
            Text(
              //  'غرف تغيير للاطفال',
              name!,
              style: const TextStyle(
                  color: Color(0xff333333),
                  fontFamily: ('DINNextLTArabic'),
                  fontSize: 13.0),
            ),
          ],
        ),
      ),
    );
  }
}



















/*
SingleChildScrollView(
                                scrollDirection: Axis.horizontal,

                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const MedicalAid())),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Container(
                                          width: 135,
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,

                                            borderRadius: BorderRadius.all(
                                              Radius.circular(25),
                                            ), //BorderRadius.all
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/icons/path_6187.png',
                                                width: 32.0,
                                                height: 32.0,
                                              ),
                                              const Text(
                                                'غرفة الأسعافات الأوليه',
                                                style: TextStyle(
                                                    color: Color(0xff333333),
                                                    fontFamily:
                                                        ('DINNextLTArabic'),
                                                    fontSize: 13.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),

                                    ///أجهزة الصراف الآلى
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const ATM())),
                                      child: Container(
                                        width: 135,
                                        height: 100,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          ), //BorderRadius.all
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/layer_10.png',
                                              width: 32.0,
                                              height: 32.0,
                                            ),
                                            const Text(
                                              'أجهزة الصراف الآلى',
                                              style: TextStyle(
                                                  color: Color(0xff333333),
                                                  fontFamily:
                                                      ('DINNextLTArabic'),
                                                  fontSize: 13.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),

                                    ///عربات للاطفال
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const BabyTrolly())),
                                      child: Container(
                                        width: 135,
                                        height: 100,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          ), //BorderRadius.all
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/layer_11.png',
                                              width: 32.0,
                                              height: 32.0,
                                            ),
                                            const Text(
                                              'عربات للاطفال',
                                              style: TextStyle(
                                                  color: Color(0xff333333),
                                                  fontFamily:
                                                      ('DINNextLTArabic'),
                                                  fontSize: 13.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),

                                    ///غرف تغيير للاطفال
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const BabyChnaging())),
                                      child:
                                       Container(
                                        width: 135,
                                        height: 100,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          ), //BorderRadius.all
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/g_10.png',
                                              width: 32.0,
                                              height: 32.0,
                                            ),
                                            const Text(
                                              'غرف تغيير للاطفال',
                                              style: TextStyle(
                                                  color: Color(0xff333333),
                                                  fontFamily:
                                                      ('DINNextLTArabic'),
                                                  fontSize: 13.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                      width: 20,
                                    ),

                                    ///كراسى متحركه
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const WheelChair())),
                                      child: Container(
                                        width: 135,
                                        height: 100,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          ), //BorderRadius.all
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/wheelchair.png',
                                              width: 32.0,
                                              height: 32.0,
                                            ),
                                            const Text(
                                              'كراسى متحركه',
                                              style: TextStyle(
                                                  color: Color(0xff333333),
                                                  fontFamily:
                                                      ('DINNextLTArabic'),
                                                  fontSize: 13.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),

                                    ///انترنت مجانا
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const FreeInternet())),
                                      child: Container(
                                        width: 135,
                                        height: 100,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          ), //BorderRadius.all
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/wifi.png',
                                              width: 32.0,
                                              height: 32.0,
                                            ),
                                            const Text(
                                              'انترنت مجانا',
                                              style: TextStyle(
                                                  color: Color(0xff333333),
                                                  fontFamily:
                                                      ('DINNextLTArabic'),
                                                  fontSize: 13.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),

                                    ///مساجد
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const Mosques())),
                                      child: Container(
                                        width: 135,
                                        height: 100,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25),
                                          ), //BorderRadius.all
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/group_1307.png',
                                              width: 32.0,
                                              height: 32.0,
                                            ),
                                            const Text(
                                              'مساجد',
                                              style: TextStyle(
                                                  color: Color(0xff333333),
                                                  fontFamily:
                                                      ('DINNextLTArabic'),
                                                  fontSize: 13.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // ],
                              ),
*/