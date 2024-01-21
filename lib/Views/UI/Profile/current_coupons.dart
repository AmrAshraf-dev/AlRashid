import 'package:alrashid_mall_app/api/controllers/coupons_controller.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/coupons_state.dart';
import 'package:alrashid_mall_app/employee_files/core/bloc/lang_cubit/lang_cubit.dart';
import 'package:alrashid_mall_app/employee_files/core/localization/localization_methods.dart';
import 'package:alrashid_mall_app/utils/global_state.dart';
import 'package:alrashid_mall_app/widgets/coupons_widget.dart';
import 'package:alrashid_mall_app/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alrashid_mall_app/Views/UI/Profile/qr_code.dart';
import 'package:alrashid_mall_app/cubit_resources/cubit/coupons_cubit.dart';
import 'package:alrashid_mall_app/locale/locale.dart';
import 'package:alrashid_mall_app/widgets/horizontal_dotted_separator.dart';

// ignore: must_be_immutable
class CurrentCoupons extends StatefulWidget {
  String? token;

  CurrentCoupons({
    Key? key,
    this.token,
  }) : super(key: key);

  @override
  State<CurrentCoupons> createState() => _CurrentCouponsState();
}

class _CurrentCouponsState extends State<CurrentCoupons> {
  @override
  Widget build(BuildContext context) {
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;
    //var locale = AppLocalizations.of(context);
    var lang = context.read<LangCubit>().state.locale.languageCode;
    print('tokennnn : ${GlobalState.instance.get('token')}');
    final CouponsCubit _blocCoupons = BlocProvider.of<CouponsCubit>(context);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _blocCoupons.fetchAllCouponsData(
          context, GlobalState.instance.get('token'));
    });
    return Scaffold(
      body: Directionality(
        textDirection: lang == 'ar' //locale!.locale.languageCode == 'en'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Directionality(
                textDirection:
                    lang == 'ar' ? TextDirection.rtl : TextDirection.ltr,
                child: ListTile(
                  leading: Container(
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
                  title: Text(
                    tr('Available coupons'), //locale.availableCoupons!,
                    style: const TextStyle(
                      fontFamily: 'DINNextLTArabic',
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            // const Divider(
            //     thickness: 6.0,
            //     color: Color(0xffb83f48),
            //     indent: 25.0,
            //     endIndent: 25.0),

            BlocBuilder<CouponsCubit, CouponsState>(
              builder: (context, state) {
                return _blocCoupons.loading
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (c, i) => const ShimmerWidget(),
                        itemCount:
                            CouponsController.couponsModel.codes?.length ?? 0,
                        separatorBuilder: (c, i) => const SizedBox(
                          height: 10,
                        ),
                      )
                    : _blocCoupons.err
                        ? Center(
                            child: Text(
                              tr('Error'), // locale.error!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: ('DINNextLTArabic'),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: null,
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics:
                                const NeverScrollableScrollPhysics(), // new
                            itemCount:
                                CouponsController.couponsModel.codes?.length ??
                                    0,
                            itemBuilder: (BuildContext context, int index) {
                              print(
                                  'CouponsController.couponsModel <<>>::${CouponsController.couponsModel.codes![index].toJson()}');
                              return GestureDetector(
                                onTap: CouponsController.couponsModel
                                            .codes![index].usedbefore ==
                                        false
                                    ? () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (c) => QRcode(
                                                      coponText:
                                                          CouponsController
                                                                  .couponsModel
                                                                  .codes?[index]
                                                                  .code ??
                                                              '',
                                                    )));
                                      }
                                    : () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                            "تم استخدام هذا الكود من قبل , قم باستخدام كود اخر للحصول علي الخصم ",
                                            style: TextStyle(
                                                fontFamily: 'DINNextLTArabic',
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ));
                                      },
                                child: Directionality(
                                    textDirection: lang ==
                                            'ar' //  locale.locale.languageCode == 'en'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                    child: CouponsWidget(
                                      endAt: CouponsController.couponsModel
                                              .codes?[index].endAt ??
                                          '',
                                      places: CouponsController.couponsModel
                                              .codes?[index].places ??
                                          [],
                                      copone: CouponsController
                                          .couponsModel.codes?[index].discount,
                                      index: index,
                                    )),
                              );
                            });
              },
            ),
          ],
        ),
      ),
    );
  }
}
