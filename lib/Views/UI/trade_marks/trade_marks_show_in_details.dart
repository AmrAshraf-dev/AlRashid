import 'package:alrashid_mall_app/api/controllers/all_categories_controller.dart';
import 'package:alrashid_mall_app/api/controllers/home_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/all_categories_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/all_categories_state.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/categoriesbyid_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/categoriesbyid_state.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/widgets/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class TradeMarksShowInDetails extends StatefulWidget {
  String? token;
  String? name;
  String? createdAt;
  String? tradeMarkID;
  String? image;

  TradeMarksShowInDetails({
    Key? key,
    this.token,
    this.name,
    this.createdAt,
    this.tradeMarkID,
    this.image,
  }) : super(key: key);

  @override
  State<TradeMarksShowInDetails> createState() =>
      _TradeMarksShowInDetailsState();
}

class _TradeMarksShowInDetailsState extends State<TradeMarksShowInDetails> {
  bool loader = false;
  @override
  Widget build(BuildContext context) {
    const _img =
        "https://i.knwt.co/nihan/212TN5328NH1-45345/nihan-nihan-dusuk-kollu-fular-yaka-buy-297-8b_1641725834445.jpg";
    final AllCategoriesCubit _blocTradeMarksById =
        BlocProvider.of<AllCategoriesCubit>(context);
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    print(
      widget.tradeMarkID.toString(),
    );
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // ignore: avoid_single_cascade_in_expression_statements
      _blocTradeMarksById.fetchAllCategoriesData(
        context,
        widget.token ?? '',
        tradeMarkId: widget.tradeMarkID.toString(),
      );
      print('categoriesss::>>>????${HomeController.homeModel.categories}');
      print('iddddddddddddddddddddddddd : ${widget.tradeMarkID.toString()}');
      //   ..then((value) {
      //       setState(() {
      //         loader = true;
      //       });
      //     });
    });
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(body: BlocBuilder<CategoriesByIdCubit, CategoriesByIdState>(
            builder: (context, state) {
      return _blocTradeMarksById.loading
          ? ListView.separated(
              itemBuilder: (c, i) => const ShimmerWidget(),
              itemCount: 2,
              separatorBuilder: (c, i) => const SizedBox(
                height: 10,
              ),
            )
          : _blocTradeMarksById.err
              ? Center(
                  child: Text(
                    // 'هناك خطأ',
                    tr('Error'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: ('DINNextLTArabic'),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: null,
                  ),
                )
              : Directionality(
                  textDirection:
                      lang == 'en' ? TextDirection.rtl : TextDirection.ltr,
                  child: Stack(
                    children: [
                      AllCategoriesController
                              .categoriesByIdModel.category!.image!
                              .contains('svg')
                          ? SvgPicture.network(
                              AllCategoriesController
                                      .categoriesByIdModel.category?.image ??
                                  _img,
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                            )
                          : CachedNetworkImage(
                              imageUrl: AllCategoriesController
                                      .categoriesByIdModel.category?.image ??
                                  _img,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        child: Directionality(
                          textDirection: lang == 'en'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: const Color(0xff2eb83f48),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 18,
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Directionality(
                        textDirection: lang == 'en'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: Padding(
                          padding: EdgeInsets.only(top: myheight * 0.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  // 'رد تاغ - RED TAG ',
                                  lang == 'en'
                                      ? AllCategoriesController
                                              .categoriesByIdModel
                                              .category!
                                              .nameAr ??
                                          'فشل في الانترنت'
                                      : AllCategoriesController
                                              .categoriesByIdModel
                                              .category!
                                              .nameEn ??
                                          'network failed',
                                  style: const TextStyle(
                                      color: Color(0xffffffff),
                                      fontFamily: ('DINNextLTArabic'),
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                //' Dec 20 - Mar 31',
                                '${AllCategoriesController.categoriesByIdModel.category!.createdAt}',

                                style: const TextStyle(
                                    color: Color(0xffffffff),
                                    fontFamily: ('DINNextLTArabic'),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Text(
                              //     //'استمتعوا بتجربة التسوق الرائعه بالتخفيضات والعروض الهائلة لدينا',
                              //     locale.locale.languageCode == 'en'
                              //         ? AllCategoriesController
                              //                 .categoriesByIdModel
                              //                 .category!
                              //                 .descriptionAr ??
                              //             'فشل في الانترنت'
                              //         : AllCategoriesController
                              //                 .tradeMarksByIdModel
                              //                 .tradeMarksById!
                              //                 .descriptionEn ??
                              //             'network failed',
                              //     // maxLines: 2,
                              //     // overflow: TextOverflow.clip,
                              //     // softWrap: true,
                              //     textAlign: TextAlign.center,
                              //     style: const TextStyle(
                              //       color: Color(0xffffffff),
                              //       fontFamily: ('DINNextLTArabic'),
                              //       fontSize: 17.0,
                              //       // overflow: TextOverflow.ellipsis,
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: 350,
                                height: 45,
                                child: Center(
                                  child: Text(
                                    tr('show shop'),
                                    style: const TextStyle(
                                      color: Color(0xffffffff),
                                      fontFamily: ('DINNextLTArabic'),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffffffff),
                                  ),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
      //: const Center(child: ShimmerWidget());
    })
        //),
        );
  }
}
