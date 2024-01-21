import 'package:alrashid_mall_app/api/controllers/services_details_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/events_by_id_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/services_details_cubit.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/services_details_state.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/widgets/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ServicesDetails extends StatefulWidget {
  String? token;

  String? name;

  String? servicesID;

  String? image;

  String? description;
  ServicesDetails(
      {Key? key,
      this.token,
      this.name,
      this.servicesID,
      this.image,
      this.description})
      : super(key: key);

  @override
  State<ServicesDetails> createState() => _ServicesDetailsState();
}

class _ServicesDetailsState extends State<ServicesDetails> {
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    const _img =
        "https://i.knwt.co/nihan/212TN5328NH1-45345/nihan-nihan-dusuk-kollu-fular-yaka-buy-297-8b_1641725834445.jpg";
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    final ServicesDetailsCubit _blocServicesDetails =
        BlocProvider.of<ServicesDetailsCubit>(context);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // ignore: avoid_single_cascade_in_expression_statements
      _blocServicesDetails.fetchServicesDataById(
        context,
        widget.token ?? '',
        servicesDetailsId: widget.servicesID.toString(),
      )..then((value) {
          setState(() {
            loader = true;
          });
        });
    });
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Scaffold(
        body: BlocProvider(
      create: (context) => ServicesDetailsCubit()
        ..fetchServicesDataById(
          context,
          widget.token ?? '',
          servicesDetailsId: widget.servicesID.toString(),
        ),
      child: BlocBuilder<ServicesDetailsCubit, ServicesDetailsState>(
        builder: (context, state) {
          return loader == true
              ? Directionality(
                  textDirection:
                      lang == 'ar' //locale!.locale.languageCode == 'en'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                  child: Column(children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 15),
                          child: Align(
                            alignment: AlignmentDirectional.bottomStart,
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
                          )),
                    ),
                    SizedBox(
                      height: myheight * 0.3,
                    ),
                    // Image.asset(
                    //   'assets/icons/layer_10.png',
                    //   width: 32.0,
                    //   height: 32.0,
                    // ),
                    ServicesDetailsController
                            .servicesDetailsModel.service!.image!
                            .contains('svg')
                        ? SvgPicture.network(
                            ServicesDetailsController
                                    .servicesDetailsModel.service!.image ??
                                _img,
                            fit: BoxFit.cover,
                            width: 52,
                            height: 52,
                          )
                        : CachedNetworkImage(
                            imageUrl:
                                //'https://i.picsum.photos/id/194/200/300.jpg?hmac=jZgjsqqVvdWnXHdytjS2JPImgQFz9bGSyVQ31-b_eH4',
                                ServicesDetailsController
                                        .servicesDetailsModel.service!.image ??
                                    _img,
                            width: 52,
                            height: 52,
                            fit: BoxFit.cover,
                          ),
                    SizedBox(
                      height: myheight * 0.02,
                    ),
                    Text(
                      // 'أجهزة الصراف الآلى',
                      lang == 'ar' //locale.locale.languageCode == 'en'
                          ? ServicesDetailsController
                                  .servicesDetailsModel.service!.nameAr ??
                              'فشل في الانترنت'
                          : ServicesDetailsController
                                  .servicesDetailsModel.service!.nameEn ??
                              'network failed',
                      style: const TextStyle(
                          color: Color(0xff333333),
                          fontFamily: ('DINNextLTArabic'),
                          fontSize: 20.0),
                    ),
                    SizedBox(
                      height: myheight * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        //  'يوفر المول أجهزة الصراف الآلى والمتواجده في جميع انحاء المركز',
                        lang == 'ar' //locale.locale.languageCode == 'en'
                            ? ServicesDetailsController.servicesDetailsModel
                                    .service!.descriptionAr ??
                                'فشل في الانترنت'
                            : ServicesDetailsController.servicesDetailsModel
                                    .service!.descriptionEn ??
                                'network failed',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color(0xffa6a6a6),
                            fontFamily: ('DINNextLTArabic'),
                            fontSize: 18.0),
                      ),
                    ),
                  ]))
              : const Center(child: ShimmerWidget());
        },
      ),
    ));
  }
}
