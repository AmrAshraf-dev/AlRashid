import 'package:alrashid_mall_app/Views/UI/BottomNavyBar.dart';
import 'package:alrashid_mall_app/api/controllers/home_controller.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/models/all_categories_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import '../../../api/controllers/all_Categories_controller.dart';

class TradeMarksShowAll extends StatefulWidget {
  final String? token;
  final String? name;
  final String? createdAt;
  final String? tradeMarkId;
  final String? image;
  List<AllCategoriesModel>? tradeMarksShowAllModel;
  TradeMarksShowAll(
      {Key? key,
      this.token,
      this.name,
      this.createdAt,
      this.tradeMarkId,
      this.image,
      this.tradeMarksShowAllModel})
      : super(key: key);

  @override
  State<TradeMarksShowAll> createState() => _TradeMarksShowAllState();
}

class _TradeMarksShowAllState extends State<TradeMarksShowAll> {
  @override
  Widget build(BuildContext context) {
    const _img =
        "https://i.knwt.co/nihan/212TN5328NH1-45345/nihan-nihan-dusuk-kollu-fular-yaka-buy-297-8b_1641725834445.jpg";
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    // print(object)
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(
      body: Column(
        children: [
          Directionality(
            textDirection: lang == 'ar' //locale!.locale.languageCode == 'en'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Row(
              children: [
                InkWell(
                  // onTap: () => Navigator.pop(context),
                  onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MyBottomNavyBar())),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: const BoxDecoration(
                        // ignore: use_full_hex_values_for_flutter_colors
                        color: Color(0xff2eb83f48),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: lang == 'ar' //locale.locale.languageCode == 'en'
                          ? Padding(
                              padding: EdgeInsets.only(right: mywidth * 0.02),
                              child: const Icon(Icons.arrow_back_ios),
                            )
                          : Padding(
                              padding: EdgeInsets.only(left: mywidth * 0.02),
                              child: const Icon(Icons.arrow_back_ios),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: mywidth * 0.1,
                ),
                Text(
                  tr('Sections'),
                  style: const TextStyle(
                      color: Color(0xff333333),
                      fontFamily: ('DINNextLTArabic'),
                      fontSize: 25.0),
                ),
              ],
            ),
          ),
          Directionality(
            textDirection: lang == 'ar' ? TextDirection.rtl : TextDirection.ltr,
            child: Flexible(
              child: SizedBox(
                width: double.infinity,
                //height: 600,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6.0,
                            mainAxisSpacing: 24.0),
                    //scrollDirection: Axis.vertical,
                    itemCount: HomeController.homeModel.categories?.length ?? 0,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (c) => TradeMarksShowInDetails(
                          //               tradeMarkID: HomeController
                          //                   .homeModel.categories![index].id
                          //                   .toString(),
                          //             )));
                        },
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: Stack(children: [
                            // Image.asset('assets/images/mask_group_2.png'),
                            HomeController.homeModel.categories![index].image!
                                    .contains('svg')
                                ? Center(
                                    child: SvgPicture.network(
                                      HomeController.homeModel
                                              .categories?[index].image ??
                                          _img,
                                      fit: BoxFit.cover,
                                      width: 60,
                                      height: 60,
                                    ),
                                  )
                                : Center(
                                    child: CachedNetworkImage(
                                      imageUrl: HomeController.homeModel
                                              .categories?[index].image ??
                                          _img,
                                      fit: BoxFit.cover,
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                            // Image.asset(
                            //   'assets/images/pexels_delbeautybox_705255.png',
                            //   fit: BoxFit.cover,
                            //   width: 162,
                            //   height: 172,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(20.0),
                            //   child: Container(
                            //     width: 60,
                            //     height: 35,
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(20.0),
                            //         color: const Color(0xffb83f48)),
                            //     child: Center(
                            //       child: Text(
                            //         // 'الآن',
                            //         locale.locale.languageCode == 'en'
                            //             ? HomeController.homeModel
                            //                     .categories![index].createdAt ??
                            //                 'لا يوجد'
                            //             : HomeController.homeModel
                            //                     .categories?[index].createdAt ??
                            //                 'no data',
                            //         overflow: TextOverflow.ellipsis,
                            //         textAlign: TextAlign.center,
                            //         style: const TextStyle(
                            //             color: Colors.white,
                            //             fontFamily: ('DINNextLTArabic'),
                            //             fontSize: 10.0),
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  // 'فرزاتشى-VERSACE',
                                  lang == 'ar'
                                      ? HomeController.homeModel
                                              .categories![index].nameAr ??
                                          'لا يوجد'
                                      : HomeController.homeModel
                                              .categories![index].nameEn ??
                                          'no data',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: ('DINNextLTArabic'),
                                      fontSize: 14.0),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
