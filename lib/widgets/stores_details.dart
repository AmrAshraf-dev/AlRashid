import 'package:alrashid_mall_app/api/controllers/stroes_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/stores_details_cubit%20.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/stores_details_state.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/widgets/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class StoresDetails extends StatefulWidget {
  String? token;
  String? name;
  String? workTimeFrom;
  String? workTimeTo;
  String? storesDetailsID;
  String? image;
  String? description;
  StoresDetails({
    Key? key,
    this.token,
    this.name,
    this.workTimeFrom,
    this.workTimeTo,
    this.storesDetailsID,
    this.image,
    this.description,
  }) : super(key: key);

  @override
  State<StoresDetails> createState() => _StoresDetailsState();
}

class _StoresDetailsState extends State<StoresDetails> {
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    final StoresDetailsCubit _blocStoresDetails =
        BlocProvider.of<StoresDetailsCubit>(context);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // ignore: avoid_single_cascade_in_expression_statements
      _blocStoresDetails.fetchStoresDetailsData(
        context,
        widget.token ?? '',
        storesDetailsId: widget.storesDetailsID.toString(),
      );
      // ..then((value) {
      //     setState(() {
      //       loader = true;
      //     });
      //   });
    });

    const _img =
        "https://i.knwt.co/nihan/212TN5328NH1-45345/nihan-nihan-dusuk-kollu-fular-yaka-buy-297-8b_1641725834445.jpg";
    // final StoresDetailsCubit _blocStoresDetails =
    //     BlocProvider.of<StoresDetailsCubit>(context);

    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(
      body:
          //BlocProvider(
          // create: (context) => StoresDetailsCubit()
          //   ..fetchStoresDetailsData(
          //     context,
          //     widget.token ?? '',
          //     storesDetailsId: widget.storesDetailsID.toString(),
          //   ),
          //child:
          BlocBuilder<StoresDetailsCubit, StoresDetailsState>(
        builder: (context, state) {
          print(
              'imaaaaageee ::${StoresController.mySinglePlaceModel.singlePlaceModel?.image ?? ''}');
          return _blocStoresDetails.loading
              ? ListView.separated(
                  itemBuilder: (c, i) => const ShimmerWidget(),
                  itemCount: 6,
                  separatorBuilder: (c, i) => const SizedBox(
                    height: 10,
                  ),
                )
              // Padding(
              //     padding: EdgeInsets.only(top: myheight * 0.25),
              //     child: const CircularProgressIndicator(
              //       color: Color(0xffb83f48),
              //     ),
              //   )
              : _blocStoresDetails.err
                  ? Center(
                      child: Text(
                        tr('Error'),
                        style: const TextStyle(
                          //color: Colors.white,
                          fontFamily: ('DINNextLTArabic'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: null,
                      ),
                    )
                  : //loader == true
                  //?
                  Directionality(
                      textDirection:
                          lang == 'ar' //locale!.locale.languageCode == 'en'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/events_details.png',
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
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Padding(
                              padding: const EdgeInsets.all(40.0),
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
                                child: lang ==
                                        'ar' //locale.locale.languageCode == 'en'
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                            right: mywidth * 0.02),
                                        child: const Icon(Icons.arrow_back_ios),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.only(
                                            left: mywidth * 0.02),
                                        child: const Icon(Icons.arrow_back_ios),
                                      ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: myheight * 0.2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ), //BorderRadius.all
                                  ),
                                  child: Center(
                                    child:
                                        // Image.asset(
                                        //   'assets/images/giordano.png',
                                        //   width: 70,
                                        //   height: 45,
                                        // ),
                                        StoresController.mySinglePlaceModel
                                                .singlePlaceModel!.image!
                                                .contains('svg')
                                            ? SvgPicture.network(
                                                StoresController
                                                        .mySinglePlaceModel
                                                        .singlePlaceModel!
                                                        .image ??
                                                    _img,
                                                fit: BoxFit.cover,
                                                height: double.infinity,
                                                width: double.infinity,
                                              )
                                            : CachedNetworkImage(
                                                imageUrl: StoresController
                                                        .mySinglePlaceModel
                                                        .singlePlaceModel!
                                                        .image ??
                                                    _img,
                                                height: double.infinity,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    // 'جيوردانو ',
                                    lang == 'ar'
                                        ? StoresController.mySinglePlaceModel
                                                .singlePlaceModel!.nameAr ??
                                            ''
                                        : StoresController.mySinglePlaceModel
                                                .singlePlaceModel!.nameEn ??
                                            '',
                                    style: const TextStyle(
                                        color: Color(0xffffffff),
                                        fontFamily: ('DINNextLTArabic'),
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  // 'الدور الاول',
                                  StoresController.mySinglePlaceModel
                                          .singlePlaceModel?.floorNumber ??
                                      '',
                                  style: const TextStyle(
                                    color: Color(0xffffffff),
                                    fontFamily: ('DINNextLTArabic'),
                                    fontSize: 15.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      tr('workHours'),
                                      style: const TextStyle(
                                        color: Color(0xffffffff),
                                        fontFamily: ('DINNextLTArabic'),
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Text(
                                      //' Dec 20 - Mar 31',
                                      '${StoresController.mySinglePlaceModel.singlePlaceModel?.workTimeFrom ?? ''} - ${StoresController.mySinglePlaceModel.singlePlaceModel?.workTimeTo ?? ''}',
                                      style: const TextStyle(
                                        color: Color(0xffffffff),
                                        fontFamily: ('DINNextLTArabic'),
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    // 'توفر أديداس مجموعه كامله من الملابس والحقائب والاكسسورات المثاليه للقيام  بالتمارين الرياضيه',
                                    lang == 'ar'
                                        ? StoresController
                                                .mySinglePlaceModel
                                                .singlePlaceModel
                                                ?.descriptionAr ??
                                            ''
                                        : StoresController
                                                .mySinglePlaceModel
                                                .singlePlaceModel
                                                ?.descriptionEn ??
                                            '',
                                    // maxLines: 2,
                                    // overflow: TextOverflow.clip,
                                    // softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xffffffff),
                                      fontFamily: ('DINNextLTArabic'),
                                      fontSize: 17.0,
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 100,
                                ),
                                // Container(
                                //   width: 350,
                                //   height: 45,
                                //   child: Center(
                                //     child: Text(
                                //       locale.showInMap!,
                                //       style: const TextStyle(
                                //         color: Color(0xffffffff),
                                //         fontFamily: ('DINNextLTArabic'),
                                //         fontSize: 18.0,
                                //       ),
                                //     ),
                                //   ),
                                //   decoration: BoxDecoration(
                                //     border: Border.all(
                                //       color: const Color(0xffffffff),
                                //     ),
                                //     borderRadius: BorderRadius.circular(22),
                                //   ),
                                // ),
                                // const SizedBox(
                                //   height: 20,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
          //: const Center(child: ShimmerWidget());
        },
      ),
      // ),
    );
  }
}
