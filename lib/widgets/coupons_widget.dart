import 'package:alrashid_mall_app/api/controllers/coupons_controller.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/models/coupons_model.dart';
import 'package:flutter/material.dart';

import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/widgets/horizontal_dotted_separator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CouponsWidget extends StatelessWidget {
  List<dynamic>? places;
  String? endAt;
  String? copone;
  int index;
  CouponsWidget(
      {Key? key, this.places, this.endAt, this.copone, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return Directionality(
      textDirection: lang == 'en' //locale!.locale.languageCode == 'en'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              height: 6.0,
              color: CouponsController.couponsModel.codes![index].usedbefore ==
                      false
                  ? const Color(0xffb83f48)
                  : Colors.grey,
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
            ),

            ///

            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Container(
                height:
                    CouponsController.couponsModel.codes![index].usedbefore ==
                            false
                        ? 180.0
                        : 170,
                color:
                    CouponsController.couponsModel.codes![index].usedbefore ==
                            false
                        ? const Color(0xff69f2dcde)
                        : Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 25.0, top: 12.0, bottom: 12.0, left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            tr('Voucher'),
                            style: TextStyle(
                                fontFamily: 'DINNextLTArabic',
                                fontSize: 20,
                                color: CouponsController.couponsModel
                                            .codes![index].usedbefore ==
                                        false
                                    ? const Color(0xffb83f48)
                                    : Colors.grey),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '$copone ${tr('RS')}',
                            style: TextStyle(
                                fontFamily: 'DINNextLTArabic',
                                fontSize: 20,
                                color: CouponsController.couponsModel
                                            .codes![index].usedbefore ==
                                        false
                                    ? const Color(0xffb83f48)
                                    : Colors.grey),
                          ),
                          const Spacer(),
                          CouponsController
                                      .couponsModel.codes![index].usedbefore ==
                                  true
                              ? const Icon(
                                  Icons.check_circle_sharp,
                                  color: Colors.green,
                                )
                              : Container()
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: MySeparator(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Text(
                            tr('Expiry date'),
                            style: const TextStyle(
                              fontFamily: 'DINNextLTArabic',
                              fontSize: 12,
                              color: Color(0xff8d8d8d),
                            ),
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            // '20/05/2022',
                            endAt ?? '',
                            style: const TextStyle(
                              fontFamily: 'DINNextLTArabic',
                              fontSize: 12,
                              color: Color(0xff8d8d8d),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        lang == 'en' // locale.locale.languageCode == 'en'
                            ?
                            // 'جيوردانو / أديداس / نعومى / أتش أند أم',
                            CouponsController.placesModel.nameAr ?? ''
                            : CouponsController.placesModel.nameEn ?? '',
                        style: const TextStyle(
                          fontFamily: 'DINNextLTArabic',
                          fontSize: 12,
                          color: Color(0xff8d8d8d),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      CouponsController.couponsModel.codes![index].usedbefore ==
                              true
                          ? Row(
                              children: [
                                const Text(
                                  "المتجر",
                                  style: TextStyle(
                                    fontFamily: 'DINNextLTArabic',
                                    fontSize: 12,
                                    color: Color(0xff8d8d8d),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30.0,
                                ),
                                Text(
                                  CouponsController.couponsModel.codes![index]
                                          .usedplace?.nameAr ??
                                      "",
                                  style: const TextStyle(
                                    fontFamily: 'DINNextLTArabic',
                                    fontSize: 13,
                                    color: Color(0xff8d8d8d),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      Visibility(
                        visible: CouponsController
                                .couponsModel.codes![index].places!.isEmpty &&
                            CouponsController
                                    .couponsModel.codes![index].usedbefore ==
                                false,
                        child: const Text(
                          "علي جميع الطلبات",
                          style: TextStyle(
                            fontFamily: 'DINNextLTArabic',
                            fontSize: 12,
                            color: Color(0xff8d8d8d),
                          ),
                        ),
                        replacement: Visibility(
                          visible: CouponsController.couponsModel.codes![index]
                                  .places!.isNotEmpty &&
                              CouponsController
                                      .couponsModel.codes![index].usedbefore ==
                                  false,
                          child: Text(
                            CouponsController.couponsModel.codes![index].places!
                                .fold(
                                    "",
                                    (pre, element) =>
                                        "$pre , ${element.nameAr}"),
                            style: const TextStyle(
                              fontFamily: 'DINNextLTArabic',
                              fontSize: 12,
                              color: Color(0xff8d8d8d),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
